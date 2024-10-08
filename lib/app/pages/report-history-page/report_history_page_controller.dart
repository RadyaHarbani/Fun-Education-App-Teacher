import 'package:fun_education_app_teacher/app/api/daily-report/models/event_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_by_user_id_response.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_grade_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class ReportHistoryPageController extends GetxController {
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  RefreshController refreshController = RefreshController();
  RxInt userGrade = 0.obs;
  RxString userId = ''.obs;
  RxString userName = ''.obs;
  RxString userNote = ''.obs;
  RxString incomingShift = ''.obs;
  RxString userPermission = ''.obs;
  RxBool isLoadingReportHistory = false.obs;

  DailyReportService dailyReportService = DailyReportService();
  ShowByUserIdResponse? showByUserIdResponse;
  RxList<ShowGradeModel> showGradeModel = <ShowGradeModel>[].obs;
  Rx<DateTime> selectedDay = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  Rx<LinkedHashMap<DateTime, List<Event>>> events =
      LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments['userId'];
    userName.value = Get.arguments['userName'];
    incomingShift.value = Get.arguments['incomingShift'];
    showByUserId(userId.value, selectedDay.value.toString());
    showAvailableDateByUserId(userId.value);
  }

  Future<void> showAvailableDateByUserId(String userId) async {
    try {
      final response =
          await dailyReportService.getShowAvailableDateByUserId(userId);
      final List<String> dateStrings = response.data['dates'].cast<String>();
      List<DateTime> showAvailableDate = dateStrings
          .map((date) => DateFormat('yyyy-MM-dd').parse(date))
          .toList();

      LinkedHashMap<DateTime, List<Event>> newEvents =
          LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );

      for (var date in showAvailableDate) {
        newEvents[date] = [Event('Laporan')];
      }

      events.value = newEvents;

      _updateSelectedEvents(DateTime.now());
    } catch (e) {
      print(e);
    }
  }

  void _updateSelectedEvents(DateTime day) {
    selectedDay.value = day;
    focusedDay.value = day;
  }

  Future<void> onDaySelected(DateTime selectedDay, DateTime focusedDay) async {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
    await showByUserId(userId.value, selectedDay.toString());
  }

  Future showByUserId(String userId, String date) async {
    try {
      isLoadingReportHistory(true);
      showGradeModel.clear();
      userGrade.value = 0;
      userNote.value = '';
      userPermission.value = '';
      final response = await dailyReportService.getShowDailyReportByUserId(
          userId, DateFormat('yyyy-MM-dd').format(DateTime.parse(date)));
      showByUserIdResponse = ShowByUserIdResponse.fromJson(response.data);
      showGradeModel.value = showByUserIdResponse!.data;
      userGrade.value = showByUserIdResponse!.totalPoint;
      userNote.value = showByUserIdResponse!.note ?? '';
      userPermission.value = showByUserIdResponse!.permission;
      isLoadingReportHistory(false);
      update();
    } catch (e) {
      isLoadingReportHistory(false);
      print(e);
    }
  }

  Future deleteDailyReportByAdmin() async {
    try {
      await dailyReportService.deleteDailyReportByAdmin(
        DateFormat('yyyy-MM-dd').format(selectedDay.value),
        userId.value,
      );
      await detailClassPageController.showUserDone(
        'true',
        incomingShift.value,
        selectedDay.value,
      );
      await detailClassPageController.showUserUndone(
        'false',
        incomingShift.value,
        selectedDay.value,
      );
      await showAvailableDateByUserId(userId.value);

      Get.back();
      Get.snackbar(
        'Berhasil',
        'Laporan harian berhasil dihapus',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Gagal',
        'Laporan harian gagal dihapus',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
