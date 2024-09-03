import 'dart:async';
import 'package:board_datetime_picker/board_datetime_picker.dart';
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
  var selectedDateTime = DateTime.now().obs;
  RxBool isLoadingDetailClass = false.obs;

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
  RxList<ShowUserDoneUndoneModel> showUserDoneModel =
      <ShowUserDoneUndoneModel>[].obs;
  RxList<ShowUserDoneUndoneModel> showUserPermissionHadir =
      <ShowUserDoneUndoneModel>[].obs;
  RxList<ShowUserDoneUndoneModel> showUserPermissionIzin =
      <ShowUserDoneUndoneModel>[].obs;
  RxList<ShowUserDoneUndoneModel> showUserPermissionSakit =
      <ShowUserDoneUndoneModel>[].obs;
  RxList<ShowUserDoneUndoneModel> showUserUndoneModel =
      <ShowUserDoneUndoneModel>[].obs;

  LeaderboardService leaderboardService = LeaderboardService();
  LeaderboardResponse? leaderboardResponse;
  RxList<LeaderboardModel> leaderboardWeeklyModel = <LeaderboardModel>[].obs;
  RxList<LeaderboardModel> leaderboardMonthlyModel = <LeaderboardModel>[].obs;

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
      isLoadingDetailClass(true);
      final response = await incomingShiftService.getShowByIdIncomingShift(id);
      showByIdIncomingShiftResponse =
          ShowByIdIncomingShiftResponse.fromJson(response.data);
      showAllIncomingShiftModel.value = showByIdIncomingShiftResponse!.data;
      await _loadDataForSelectedShift();
    } catch (e) {
      print(e);
    } finally {
      isLoadingDetailClass(false);
    }
  }

  Future _loadDataForSelectedShift() async {
    String shift = showAllIncomingShiftModel.value.shiftMasuk!;
    DateTime date = selectedDateTime.value;

    await Future.wait([
      showAllUserByIncomingShift(shift),
      showStatusCount(shift),
      showByNewStatus(shift),
      showByCloseStatus(shift),
      showByArchiveStatus(shift),
      showUserDone('true', shift, date),
      showUserUndone('false', shift, date),
      showLeaderboardWeeklyByIncomingShift('weekly', shift),
      showLeaderboardMonthlyByIncomingShift('monthly', shift),
    ]);
  }

  void selectDateTime(BuildContext context) async {
    final value = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.date,
      initialDate: selectedDateTime.value,
      minimumDate: DateTime(1900),
      options: BoardDateTimeOptions(
        languages: BoardPickerLanguages(
          today: 'Hari ini',
          tomorrow: 'Besok',
          now: 'Sekarang',
          locale: 'id',
        ),
        startDayOfWeek: DateTime.monday,
        pickerFormat: PickerFormat.dmy,
        activeColor: primaryColor,
        backgroundDecoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        boardTitle: 'Pilih Tanggal',
        boardTitleTextStyle: tsBodyMediumSemibold(blackColor),
      ),
    );

    if (value != null) {
      if (value.isAfter(DateTime.now())) {
        Get.snackbar(
          'Tanggal tidak valid',
          'Tanggal yang dipilih tidak boleh melebihi hari ini.',
          backgroundColor: dangerColor,
          colorText: whiteColor,
        );
      } else {
        selectedDateTime.value = value;
        isLoadingDetailClass(true);
        await _loadDataForSelectedShift();
        isLoadingDetailClass(false);
      }
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

  Future showUserDone(String isDone, String shift, DateTime date) async {
    try {
      final response =
          await dailyReportService.getShowUserDoneUndone(isDone, shift, date);
      showUserDoneUndoneResponse =
          ShowUserDoneUndoneResponse.fromJson(response.data);
      showUserDoneModel.value = showUserDoneUndoneResponse!.data;
      showUserPermissionHadir.value = showUserDoneModel
          .where((permission) => permission.permission == 'Hadir')
          .toList();
      showUserPermissionIzin.value = showUserDoneModel
          .where((permission) => permission.permission == 'Izin')
          .toList();
      showUserPermissionSakit.value = showUserDoneModel
          .where((permission) => permission.permission == 'Sakit')
          .toList();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showUserUndone(String isDone, String shift, DateTime date) async {
    try {
      showUserUndoneModel.clear();
      final response =
          await dailyReportService.getShowUserDoneUndone(isDone, shift, date);
      showUserDoneUndoneResponse =
          ShowUserDoneUndoneResponse.fromJson(response.data);
      showUserUndoneModel.value = showUserDoneUndoneResponse!.data;
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
