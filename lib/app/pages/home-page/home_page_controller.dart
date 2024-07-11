import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/emergency-note/models/show_latest_emergency_note_model.dart';
import 'package:fun_education_app_teacher/app/api/emergency-note/models/show_latest_emergency_note_response.dart';
import 'package:fun_education_app_teacher/app/api/emergency-note/service/emergency_note_service.dart';
import 'package:fun_education_app_teacher/app/api/users/models/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/users/models/show_current_user_response.dart';
import 'package:fun_education_app_teacher/app/api/users/service/user_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late TextEditingController addEmergencyNoteController;
  late TextEditingController editEmergencyNoteController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;

  EmergencyNoteService emergencyNoteService = EmergencyNoteService();
  ShowLatestEmergencyNoteResponse? showLatestEmergencyNoteResponse;
  Rx<ShowLatestEmergencyNoteModel> showLatestEmergencyNoteModel =
      ShowLatestEmergencyNoteModel().obs;

  @override
  void onInit() {
    super.onInit();
    addEmergencyNoteController = TextEditingController();
    editEmergencyNoteController = TextEditingController();
    showCurrentUser();
    showLatestEmergencyNote();
  }

  Future showCurrentUser() async {
    try {
      final response = await userService.getShowCurrentUser();
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      showCurrentUserModel.value = showCurrentUserResponse!.data;
      // isLoading.value = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future showLatestEmergencyNote() async {
    try {
      final response = await emergencyNoteService.getShowLatestCatatanDarurat();
      showLatestEmergencyNoteResponse =
          ShowLatestEmergencyNoteResponse.fromJson(response.data);
      showLatestEmergencyNoteModel.value =
          showLatestEmergencyNoteResponse!.data;
      editEmergencyNoteController.text =
          showLatestEmergencyNoteModel.value.catatan ?? '';
      // isLoading.value = false;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future storeEmergencyNoteByAdmin() async {
    try {
      await emergencyNoteService
          .postStoreEmergencyNoteByAdmin(addEmergencyNoteController.text);
      showLatestEmergencyNote();
      addEmergencyNoteController.clear();
      update();
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  Future updateEmergencyNoteByAdmin(String id) async {
    try {
      await emergencyNoteService.putUpdateEmergencyNoteByAdmin(
          editEmergencyNoteController.text, id);
      showLatestEmergencyNote();
      editEmergencyNoteController.clear();
      update();
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  Future deleteEmergencyNoteByAdmin(String id) async {
    try {
      await emergencyNoteService.deleteEmergencyNoteByAdmin(id);
      showLatestEmergencyNoteModel.value = ShowLatestEmergencyNoteModel();
      update();
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}
