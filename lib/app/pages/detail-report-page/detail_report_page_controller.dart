import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_by_user_id_response.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_grade_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailReportPageController extends GetxController {
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
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

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments['userId'];
    userFullName.value = Get.arguments['userFullName'];
    userDate = Get.arguments['date'];
    incomingShift.value = Get.arguments['incomingShift'];
    showByUserId(
      userId.value,
      DateFormat('yyyy-MM-dd').format(userDate),
    );
  }

  Future showByUserId(String userId, String date) async {
    try {
      final response =
          await dailyReportService.getShowDailyReportByUserId(userId, date);
      showByUserIdResponse = ShowByUserIdResponse.fromJson(response.data);
      showGradeModel.value = showByUserIdResponse!.data;
      userGrade.value = showByUserIdResponse!.totalPoint;
      userNote.value = showByUserIdResponse!.note ?? '';
      userPermission.value = showByUserIdResponse!.permission;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future deleteDailyReportByAdmin() async {
    try {
      await dailyReportService.deleteDailyReportByAdmin(
        DateFormat('yyyy-MM-dd').format(userDate),
        userId.value,
      );
      await detailClassPageController.showUserDoneUndone(
        'true',
        incomingShift.value,
      );
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
