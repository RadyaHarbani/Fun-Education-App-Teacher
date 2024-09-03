import 'dart:async';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/emergency-note/models/latest-emergency-note/show_latest_emergency_note_model.dart';
import 'package:fun_education_app_teacher/app/api/emergency-note/models/latest-emergency-note/show_latest_emergency_note_response.dart';
import 'package:fun_education_app_teacher/app/api/emergency-note/service/emergency_note_service.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_model.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/service/incoming_shift_service.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_response.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageController extends GetxController {
  RxBool isLoadingAddBottomsheet = false.obs;
  RxBool isLoadingEditBottomsheet = false.obs;
  RxBool isLoadingShowAllIncomingShift = false.obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  late TextEditingController addEmergencyNoteController;
  late TextEditingController editEmergencyNoteController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var selectedFiles = <PlatformFile>[].obs;

  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;

  EmergencyNoteService emergencyNoteService = EmergencyNoteService();
  ShowLatestEmergencyNoteResponse? showLatestEmergencyNoteResponse;
  Rx<ShowLatestEmergencyNoteModel> showLatestEmergencyNoteModel =
      ShowLatestEmergencyNoteModel().obs;

  IncomingShiftService incomingShiftService = IncomingShiftService();
  ShowAllIncomingShiftResponse? showAllIncomingShiftResponse;
  RxList<ShowAllIncomingShiftModel> showAllIncomingShiftModel =
      <ShowAllIncomingShiftModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    addEmergencyNoteController = TextEditingController();
    editEmergencyNoteController = TextEditingController();
    showAllIncomingShift();
  }

  void pickFile() async {
    selectedFiles.clear();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
    );

    if (result != null) {
      selectedFiles.addAll(result.files);
    }
  }

  void removeSelectedFile(int index) {
    selectedFiles.removeAt(index);
  }

  Future showCurrentUserTeacher() async {
    try {
      final response = await userService.getShowCurrentUserTeacher();
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      showCurrentUserModel.value = showCurrentUserResponse!.data;
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
      update();
    } catch (e) {
      print(e);
    }
  }

  Future storeEmergencyNoteByAdmin() async {
    try {
      isLoadingAddBottomsheet(true);

      final response = await emergencyNoteService
          .postStoreEmergencyNoteByAdmin(addEmergencyNoteController.text);

      final String idEmergencyNote = response.data['data']['id'].toString();

      List<File> files =
          selectedFiles.map((xfile) => File(xfile.path!)).toList();
      if (selectedFiles.isNotEmpty) {
        for (var file in files) {
          final response =
              await emergencyNoteService.postStoreFileEmergencyNoteByAdmin(
            idEmergencyNote,
            file.path.split('/').last,
            file,
          );
          print('Upload successful: ${response.data}');
        }
      }
      await showLatestEmergencyNote();
      addEmergencyNoteController.clear();
      selectedFiles.clear();

      Get.back();
      isLoadingAddBottomsheet(false);
    } catch (e) {
      print(e);
      isLoadingAddBottomsheet(false);
    }
  }

  Future deleteFileEmergencyNoteByAdmin(String id) async {
    try {
      await emergencyNoteService.deleteFileEmergencyNoteByAdmin(id);
      await showLatestEmergencyNote();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future updateEmergencyNoteByAdmin(String id) async {
    try {
      isLoadingEditBottomsheet(true);
      final response = await emergencyNoteService.putUpdateEmergencyNoteByAdmin(
          editEmergencyNoteController.text, id);

      final String idEmergencyNote = response.data['data']['id'].toString();

      List<File> files =
          selectedFiles.map((xfile) => File(xfile.path!)).toList();
      if (selectedFiles.isNotEmpty) {
        for (var file in files) {
          final response =
              await emergencyNoteService.postStoreFileEmergencyNoteByAdmin(
            idEmergencyNote,
            file.path.split('/').last,
            file,
          );
          print('Upload successful: ${response.data}');
        }
      }
      await showLatestEmergencyNote();
      addEmergencyNoteController.clear();
      selectedFiles.clear();
      update();
      Get.back();
      isLoadingEditBottomsheet(false);
    } catch (e) {
      print(e);
      isLoadingEditBottomsheet(false);
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

  Future showAllIncomingShift() async {
    try {
      isLoadingShowAllIncomingShift(true);
      showLatestEmergencyNoteModel.value = ShowLatestEmergencyNoteModel();
      final response = await incomingShiftService.getShowAllIncomingShift();
      showAllIncomingShiftResponse =
          ShowAllIncomingShiftResponse.fromJson(response.data);
      showAllIncomingShiftModel.value = showAllIncomingShiftResponse!.data;
      await showCurrentUserTeacher();
      await showLatestEmergencyNote();
      update();
      isLoadingShowAllIncomingShift(false);
    } catch (e) {
      isLoadingShowAllIncomingShift(false);
      print(e);
    }
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}
