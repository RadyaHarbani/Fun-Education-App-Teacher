import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user-done-undone/show_user_done_undone_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user-done-undone/show_user_done_undone_response.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_model.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-by-id-incoming-shift/show_by_id_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/service/incoming_shift_service.dart';
import 'package:fun_education_app_teacher/app/api/leaderboard/models/leaderboard_model.dart';
import 'package:fun_education_app_teacher/app/api/leaderboard/models/leaderboard_response.dart';
import 'package:fun_education_app_teacher/app/api/leaderboard/service/leaderboard_service.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_model.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_list_response.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-status-count/show_status_count_model.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-status-count/show_status_count_response.dart';
import 'package:fun_education_app_teacher/app/api/task/service/task_service.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-all-user-by-incoming-shift/show_all_user_by_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailClassPageController extends GetxController
    with SingleGetTickerProviderMixin {
  RefreshController refreshController = RefreshController();
  TabController? tabControllerAll;
  TabController? tabControllerHomework;
  var selectedPeriod = 'Mingguan'.obs;

  IncomingShiftService incomingShiftService = IncomingShiftService();
  ShowByIdIncomingShiftResponse? showByIdIncomingShiftResponse;
  Rx<ShowAllIncomingShiftModel> showAllIncomingShiftModel =
      ShowAllIncomingShiftModel().obs;

  UserService userService = UserService();
  ShowAllUserByIncomingShiftResponse? showAllUserByIncomingShiftResponse;
  RxList<ShowCurrentUserModel> showCurrentUserModel =
      <ShowCurrentUserModel>[].obs;

  TaskService taskService = TaskService();
  ShowStatusCountResponse? showStatusCountResponse;
  Rx<ShowStatusCountModel> showStatusCountModel = ShowStatusCountModel().obs;

  ShowByStatusListResponse? showByStatusListResponse;
  RxList<ShowByStatusModel> showByNewStatusList = <ShowByStatusModel>[].obs;
  RxList<ShowByStatusModel> showByCloseStatusList = <ShowByStatusModel>[].obs;
  RxList<ShowByStatusModel> showByArchiveStatusList = <ShowByStatusModel>[].obs;
  Rx<ShowByStatusModel> showByTaskIdDetail = ShowByStatusModel().obs;

  DailyReportService dailyReportService = DailyReportService();
  ShowUserDoneUndoneResponse? showUserDoneUndoneResponse;
  RxList<ShowUserDoneUndoneModel> showUserDoneModel = <ShowUserDoneUndoneModel>[].obs;

  LeaderboardService leaderboardService = LeaderboardService();
  LeaderboardResponse? leaderboardResponse;
  RxList<LeaderboardModel> leaderboardWeeklyModel = <LeaderboardModel>[].obs;
  RxList<LeaderboardModel> leaderboardMonthlyModel = <LeaderboardModel>[].obs;

  void selectPeriod(String option) {
    selectedPeriod.value = option;
  }

  @override
  void onInit() {
    super.onInit();
    tabControllerAll = TabController(length: 3, vsync: this);
    tabControllerHomework = TabController(length: 3, vsync: this);
    showByIdIncomingShift(Get.arguments);
  }

  @override
  void dispose() {
    super.dispose();
    tabControllerAll!.dispose();
    tabControllerHomework!.dispose();
  }

  Future showByIdIncomingShift(String id) async {
    try {
      final response = await incomingShiftService.getShowByIdIncomingShift(id);
      showByIdIncomingShiftResponse =
          ShowByIdIncomingShiftResponse.fromJson(response.data);
      showAllIncomingShiftModel.value = showByIdIncomingShiftResponse!.data;
      showAllUserByIncomingShift(showAllIncomingShiftModel.value.shiftMasuk!);
      showStatusCount(showAllIncomingShiftModel.value.shiftMasuk!);
      showByNewStatus(showAllIncomingShiftModel.value.shiftMasuk!);
      showByCloseStatus(showAllIncomingShiftModel.value.shiftMasuk!);
      showByArchiveStatus(showAllIncomingShiftModel.value.shiftMasuk!);
      showUserDoneUndone('true', showAllIncomingShiftModel.value.shiftMasuk!);
      showLeaderboardWeeklyByIncomingShift(
          'weekly', showAllIncomingShiftModel.value.shiftMasuk!);
      showLeaderboardMonthlyByIncomingShift(
          'monthly', showAllIncomingShiftModel.value.shiftMasuk!);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showAllUserByIncomingShift(String shift) async {
    try {
      if (shift.isEmpty) return;
      final response = await userService.getShowAllUsersByIncomingShift(
          shift, 'true', 'false');
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      showCurrentUserModel.value = showAllUserByIncomingShiftResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showStatusCount(String shift) async {
    try {
      final response = await taskService.getShowStatusCount(shift);
      showStatusCountResponse = ShowStatusCountResponse.fromJson(response.data);
      showStatusCountModel.value = showStatusCountResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showByNewStatus(String shift) async {
    try {
      final response = await taskService.getShowByNewStatus(shift);
      showByStatusListResponse =
          ShowByStatusListResponse.fromJson(response.data);
      showByNewStatusList.value = showByStatusListResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showByCloseStatus(String shift) async {
    try {
      final response = await taskService.getShowByCloseStatus(shift);
      showByStatusListResponse =
          ShowByStatusListResponse.fromJson(response.data);
      showByCloseStatusList.value = showByStatusListResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showByArchiveStatus(String shift) async {
    try {
      final response = await taskService.getShowByArchiveStatus(shift);
      showByStatusListResponse =
          ShowByStatusListResponse.fromJson(response.data);
      showByArchiveStatusList.value = showByStatusListResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future updateStatusTaskByAdmin(String taskId, String status) async {
    try {
      await taskService.putUpdateStatusTaskByAdmin(taskId, status);
      await showByNewStatus(showAllIncomingShiftModel.value.shiftMasuk!);
      await showByCloseStatus(showAllIncomingShiftModel.value.shiftMasuk!);
      await showByArchiveStatus(showAllIncomingShiftModel.value.shiftMasuk!);
      await showStatusCount(showAllIncomingShiftModel.value.shiftMasuk!);
      Get.snackbar(
        'Update Successful',
        'Status berhasil diubah',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Update Failed',
        'Status gagal diubah',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }

  Future showUserDoneUndone(String isDone, String shift) async {
    try {
      final response =
          await dailyReportService.getShowUserDoneUndone(isDone, shift);
      showUserDoneUndoneResponse = ShowUserDoneUndoneResponse.fromJson(response.data);
      showUserDoneModel.value = showUserDoneUndoneResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showLeaderboardWeeklyByIncomingShift(String type, String shift) async {
    try {
      final response =
          await leaderboardService.getShowLeaderboardByIncomingShift(
        type,
        shift,
      );
      leaderboardResponse = LeaderboardResponse.fromJson(response.data);
      leaderboardWeeklyModel.value = leaderboardResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showLeaderboardMonthlyByIncomingShift(
      String type, String shift) async {
    try {
      final response =
          await leaderboardService.getShowLeaderboardByIncomingShift(
        type,
        shift,
      );
      leaderboardResponse = LeaderboardResponse.fromJson(response.data);
      leaderboardMonthlyModel.value = leaderboardResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
