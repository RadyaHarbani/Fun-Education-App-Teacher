import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/service/incoming_shift_service.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_response.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddStudentPageController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
  IncomingShiftService incomingShiftService = IncomingShiftService();
  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> showCurrentUserModel = ShowCurrentUserModel().obs;
  late TextEditingController fullNameController;
  late TextEditingController shortNameController;
  late TextEditingController genderController;
  late TextEditingController birthPlaceController;
  late TextEditingController addressController;
  late TextEditingController passwordStudentController;
  RxBool isObsecure = false.obs;
  var selectedOption = ''.obs;

  @override
  void onInit() {
    super.onInit();

    fullNameController = TextEditingController();
    shortNameController = TextEditingController();
    genderController = TextEditingController();
    birthPlaceController = TextEditingController();
    addressController = TextEditingController();
    passwordStudentController = TextEditingController();
  }

  Future showCurrentUserStudent() async {
    try {
      final response = await userService.getShowCurrentUserStudent();
      if (response.data != null) {
        showCurrentUserResponse =
            ShowCurrentUserResponse.fromJson(response.data);
        showCurrentUserModel.value = showCurrentUserResponse!.data;
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  Future register() async {
    try {
      final response = await authenticationService.register(
        fullNameController.text,
        shortNameController.text,
        birthPlaceController.text,
        addressController.text,
        selectedOption.value,
        passwordStudentController.text,
        genderController.text,
      );

      if (response.data != null && response.data['token'] != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('studentsToken', response.data['token']);

        await showCurrentUserStudent();

        if (showCurrentUserModel.value.id != null &&
            showCurrentUserModel.value.shift != null) {
          await incomingShiftService.postStoreIncomingShiftByAdmin(
            showCurrentUserModel.value.id!,
            showCurrentUserModel.value.shift,
          );
        }

        // fullNameController.clear();
        // shortNameController.clear();
        // birthPlaceController.clear();
        // addressController.clear();
        // selectedOption.value = '';
        // passwordStudentController.clear();
        // genderController.clear();

        update();
        Get.snackbar(
          'Berhasil',
          'Data siswa berhasil ditambahkan',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
        Get.back();
      } else {
        throw Exception("Token tidak tersedia dalam response.");
      }
    } catch (e) {
      Get.snackbar('Gagal', '$e',
          backgroundColor: dangerColor, colorText: whiteColor);
      print(e);
    }
  }
}
