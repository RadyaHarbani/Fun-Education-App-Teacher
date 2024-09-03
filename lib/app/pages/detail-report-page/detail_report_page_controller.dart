import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_by_user_id_response.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_grade_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailReportPageController extends GetxController {
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  RefreshController refreshController = RefreshController();

  RxString userFullName = ''.obs;
  DateTime userDate = DateTime.now();
  RxString userId = ''.obs;
  RxString incomingShift = ''.obs;
  RxInt userGrade = 0.obs;
  RxString userNote = ''.obs;
  RxString userPermission = ''.obs;
  DailyReportService dailyReportService = DailyReportService();
  ShowByUserIdResponse? showByUserIdResponse;
  RxList<ShowGradeModel> showGradeModel = <ShowGradeModel>[].obs;
  RxBool isLoadingDeleteDailyReport = false.obs;
  RxBool isLoadingDetailReport = false.obs;

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments['userId'] ?? Get.arguments['userIdHistory'];
    userFullName.value =
        Get.arguments['userFullName'] ?? Get.arguments['userFullNameHistory'];
    userDate = Get.arguments['date'] ?? Get.arguments['dateHistory'];
    incomingShift.value =
        Get.arguments['incomingShift'] ?? Get.arguments['incomingShiftHistory'];
    showByUserId(
      userId.value,
      DateFormat('yyyy-MM-dd').format(userDate),
    );
  }

  Future showByUserId(String userId, String date) async {
    try {
      isLoadingDetailReport(true);

      final response =
          await dailyReportService.getShowDailyReportByUserId(userId, date);
      showByUserIdResponse = ShowByUserIdResponse.fromJson(response.data);
      showGradeModel.value = showByUserIdResponse!.data;
      userGrade.value = showByUserIdResponse!.totalPoint;
      userNote.value = showByUserIdResponse!.note ?? '';
      userPermission.value = showByUserIdResponse!.permission;
      isLoadingDetailReport(false);
      update();
    } catch (e) {
      isLoadingDeleteDailyReport(false);
      print(e);
    }
  }

  Future deleteDailyReportByAdmin() async {
    try {
      isLoadingDeleteDailyReport(true);
      await dailyReportService.deleteDailyReportByAdmin(
        DateFormat('yyyy-MM-dd').format(userDate),
        userId.value,
      );
      await detailClassPageController.showUserDone(
        'true',
        incomingShift.value,
        userDate,
      );
      await detailClassPageController.showUserUndone(
        'false',
        incomingShift.value,
        userDate,
      );

      if (Get.arguments['userIdHistory'] != null) {
        final ReportHistoryPageController reportHistoryPageController =
            Get.put(ReportHistoryPageController());
        await reportHistoryPageController
            .showAvailableDateByUserId(userId.value);
        await reportHistoryPageController.showByUserId(
          userId.value,
          DateFormat('yyyy-MM-dd').format(userDate),
        );
      }

      Get.back();
      isLoadingDeleteDailyReport(false);
      Get.snackbar(
        'Berhasil',
        'Laporan harian berhasil dihapus',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      isLoadingDeleteDailyReport(false);
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
