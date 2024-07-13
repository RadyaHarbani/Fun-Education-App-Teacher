import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_model.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-by-id-incoming-shift/show_by_id_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/service/incoming_shift_service.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-all-user-by-incoming-shift/show_all_user_by_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:get/get.dart';

class DetailClassPageController extends GetxController
    with SingleGetTickerProviderMixin {
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
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showAllUserByIncomingShift(String shift) async {
    try {
      if (shift.isEmpty) return;
      final response = await userService.getShowAllUsersByIncomingShift(shift);
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      showCurrentUserModel.value = showAllUserByIncomingShiftResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
