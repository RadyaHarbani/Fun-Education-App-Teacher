import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/learning-flow/models/learning_flow_model.dart';
import 'package:fun_education_app_teacher/app/api/learning-flow/models/learning_flow_response.dart';
import 'package:fun_education_app_teacher/app/api/learning-flow/service/learning_flow_service.dart';
import 'package:fun_education_app_teacher/app/api/statistics/model/statistic-daily-report/statistic_daily_report_model.dart';
import 'package:fun_education_app_teacher/app/api/statistics/model/statistic-daily-report/statistic_daily_report_response.dart';
import 'package:fun_education_app_teacher/app/api/statistics/model/statistic-task/statistic_task_model.dart';
import 'package:fun_education_app_teacher/app/api/statistics/model/statistic-task/statistic_task_response.dart';
import 'package:fun_education_app_teacher/app/api/statistics/services/statistic_service.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_response.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/list-student-page/list_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailListStudentPageController extends GetxController
    with SingleGetTickerProviderMixin {
  final ListStudentPageController listStudentPageController =
      Get.put(ListStudentPageController());
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  TabController? tabControllerAll;
  var selectedLearningFlow = 'A'.obs;
  var selectedReportPoint = '5'.obs;
  var selectedTaskPoints = '5'.obs;
  RxString userId = ''.obs;

  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> detailInformationUser = ShowCurrentUserModel().obs;

  LearningFlowService learningFlowService = LearningFlowService();
  LearningFlowResponse? learningFlowResponse;
  Rx<LearningFlowModel> learningFlowModel = LearningFlowModel().obs;

  StatisticService statisticService = StatisticService();
  StatisticDailyReportResponse? statisticDailyReportResponse;
  RxList<StatisticDailyReportModel> statisticDailyReportModel =
      <StatisticDailyReportModel>[].obs;

  StatisticTaskResponse? statisticTaskResponse;
  RxList<StatisticTaskModel> statisticTaskModel = <StatisticTaskModel>[].obs;

  var spots = <FlSpot>[].obs;
  var touchedTitle = <DateTime>[].obs;
  var bottomTitles = <String?>[].obs;
  var maxX = 0.0.obs;

  var spotsTask = <FlSpot>[].obs;
  var touchedTitleTask = <String>[].obs;
  var bottomTitlesTask = <String?>[].obs;
  var maxXTask = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    tabControllerAll = TabController(length: 2, vsync: this);
    userId.value = Get.arguments;
    showByUserId(userId.value);
  }

  Future showByUserId(String userId) async {
    try {
      final response = await userService.getShowByUserId(userId);
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      detailInformationUser.value = showCurrentUserResponse!.data;
      await showLearningFlowByUserId();
      await showStatisticDailyReportByUserId();
      await showStatisticTaskByUserId();
      print(detailInformationUser);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showLearningFlowByUserId() async {
    try {
      final response = await learningFlowService.getLearningFlowByUserId(
        userId.value,
      );
      learningFlowResponse = LearningFlowResponse.fromJson(response.data);
      learningFlowModel.value = learningFlowResponse!.data;
      selectedLearningFlow.value = learningFlowModel.value.tahap!;
      print(learningFlowModel);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future updateLearningFlowByAdmin() async {
    try {
      await learningFlowService.putUpdateLearningFlowByAdmin(
        learningFlowModel.value.id!,
        userId.value,
        selectedLearningFlow.value,
      );
      await showLearningFlowByUserId();
      Get.back();
      Get.snackbar(
        'Berhasil',
        'Data alur belajar berhasil diubah',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Gagal',
        'Data alur belajar gagal diubah',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }

  Future deleteUserByAdmin() async {
    try {
      await userService.deleteUserByAdmin(userId.value);
      await listStudentPageController
          .showAllUserByIncomingShift(detailInformationUser.value.shift);
      await detailClassPageController
          .showAllUserByIncomingShift(detailInformationUser.value.shift);
      Get.back();
      Get.snackbar(
        'Berhasil',
        'Data siswa berhasil dihapus',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Gagal',
        'Data siswa gagal dihapus',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }

  Future showStatisticDailyReportByUserId() async {
    try {
      final response =
          await statisticService.getShowStatisticDailyReportByUserId(
        selectedReportPoint.value,
        userId.value,
      );
      statisticDailyReportResponse =
          StatisticDailyReportResponse.fromJson(response.data);
      statisticDailyReportModel.value = statisticDailyReportResponse!.data;

      spots.value = statisticDailyReportModel
          .map((e) => FlSpot(
                statisticDailyReportModel.indexOf(e).toDouble(),
                e.totalPoint!.toDouble(),
              ))
          .toList();
      touchedTitle.value =
          statisticDailyReportModel.map((e) => e.date!).toList();

      bottomTitles.value = List<String?>.filled(spots.length, null);
      for (var title in statisticDailyReportResponse!.bottomTitle) {
        bottomTitles[title.bottomTitleCase!] = title.date;
      }

      maxX.value = spots.length - 1.0;

      update();
    } catch (e) {
      print(e);
    }
  }

  Future showStatisticTaskByUserId() async {
    try {
      final response = await statisticService.getShowStatisticTaskByUserId(
        selectedTaskPoints.value,
        userId.value,
      );
      statisticTaskResponse = StatisticTaskResponse.fromJson(response.data);
      statisticTaskModel.value = statisticTaskResponse!.data;

      spotsTask.value = statisticTaskModel
          .map((e) => FlSpot(
                statisticTaskModel.indexOf(e).toDouble(),
                e.totalPoint!.toDouble(),
              ))
          .toList();
      touchedTitleTask.value = statisticTaskModel.map((e) => e.title!).toList();

      bottomTitlesTask.value = List<String?>.filled(spotsTask.length, null);
      for (var title in statisticTaskResponse!.bottomTitle) {
        bottomTitlesTask[title.bottomTitleCase!] = title.date;
      }

      maxXTask.value = spotsTask.length - 1.0;

      update();
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabControllerAll!.dispose();
  }
}
