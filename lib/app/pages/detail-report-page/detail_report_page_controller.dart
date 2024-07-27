import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_by_user_id_response.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_grade_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailReportPageController extends GetxController {
  RxString userFullName = ''.obs;
  DateTime userDate = DateTime.now();
  RxInt userGrade = 0.obs;
  RxString userNote = ''.obs;
  DailyReportService dailyReportService = DailyReportService();
  ShowByUserIdResponse? showByUserIdResponse;
  RxList<ShowGradeModel> showGradeModel = <ShowGradeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    userFullName.value =
        Get.arguments['userFullName'] ?? Get.arguments['userFullNameHistory'];
    userDate = Get.arguments['date'] ?? Get.arguments['dateHistory'];
    showByUserId(
      Get.arguments['userId'] ?? Get.arguments['userIdHistory'],
      DateFormat('yyyy-MM-dd')
          .format(Get.arguments['date'] ?? Get.arguments['dateHistory']),
    );
  }

  Future showByUserId(String userId, String date) async {
    try {
      final response =
          await dailyReportService.getShowDailyReportByUserId(userId, date);
      showByUserIdResponse = ShowByUserIdResponse.fromJson(response.data);
      showGradeModel.value = showByUserIdResponse!.data;
      userGrade.value = showByUserIdResponse!.totalPoint;
      userNote.value = showByUserIdResponse!.note;
      update();
    } catch (e) {
      print(e);
    }
  }
}
