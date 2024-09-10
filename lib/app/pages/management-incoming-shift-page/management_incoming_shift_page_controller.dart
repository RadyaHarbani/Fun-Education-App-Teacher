import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_model.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/service/incoming_shift_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManagementIncomingShiftPageController extends GetxController {
  IncomingShiftService incomingShiftService = IncomingShiftService();
  ShowAllIncomingShiftResponse? showAllIncomingShiftResponse;
  RxList<ShowAllIncomingShiftModel> showAllIncomingShiftModel =
      <ShowAllIncomingShiftModel>[].obs;

  TextEditingController shiftController = TextEditingController();
  TextEditingController editShiftController = TextEditingController();
  final GlobalKey<FormState> formKeyShift = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyShiftEdit = GlobalKey<FormState>();
  RefreshController refreshController = RefreshController();
  RxBool isLoadingShowAllIncomingShift = false.obs;
  RxBool isLoadingEditIncomingShift = false.obs;
  RxBool isLoadingAddIncomingShift = false.obs;
  RxBool isLoadingDeleteIncomingShift = false.obs;

  @override
  void onInit() {
    super.onInit();
    showAllIncomingShift();
  }

  Future showAllIncomingShift() async {
    try {
      isLoadingShowAllIncomingShift(true);
      final response = await incomingShiftService.getShowAllIncomingShift();
      showAllIncomingShiftResponse =
          ShowAllIncomingShiftResponse.fromJson(response.data);
      showAllIncomingShiftModel.value = showAllIncomingShiftResponse!.data;
      update();
      isLoadingShowAllIncomingShift(false);
    } catch (e) {
      isLoadingShowAllIncomingShift(false);
      print(e);
    }
  }

  Future storeIncomingShiftByAdmin() async {
    if (formKeyShift.currentState!.validate()) {
      try {
        isLoadingAddIncomingShift(true);

        await incomingShiftService
            .postStoreIncomingShiftByAdmin(shiftController.text);
        await showAllIncomingShift();
        update();
        Get.back();
        isLoadingAddIncomingShift(false);
      } catch (e) {
        isLoadingAddIncomingShift(false);
        print(e);
      }
    }
  }

  Future updateIncomingShiftByAdmin(
    String idIncomingShift,
    String shiftTime,
  ) async {
    if (formKeyShiftEdit.currentState!.validate()) {
      try {
        isLoadingEditIncomingShift(true);
        await incomingShiftService.putUpdateIncomingShiftByAdmin(
            idIncomingShift, shiftTime);
        await showAllIncomingShift();
        update();
        Get.back();
        isLoadingEditIncomingShift(false);
      } catch (e) {
        isLoadingEditIncomingShift(false);
        print(e);
      }
    }
  }

  Future deleteIncomingShiftByAdmin(String idIncomingShift) async {
    try {
      isLoadingDeleteIncomingShift(true);
      await incomingShiftService.deleteIncomingShiftByAdmin(idIncomingShift);
      await showAllIncomingShift();
      update();
      Get.back();
      isLoadingDeleteIncomingShift(false);
    } catch (e) {
      isLoadingDeleteIncomingShift(false);
      print(e);
    }
  }
}
