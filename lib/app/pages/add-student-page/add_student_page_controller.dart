import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddStudentPageController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
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

  Future register() async {
    try {
      await authenticationService.register(
        fullNameController.text,
        shortNameController.text,
        birthPlaceController.text,
        addressController.text,
        selectedOption.value,
        passwordStudentController.text,
        genderController.text,
      );
      fullNameController.clear();
      shortNameController.clear();
      birthPlaceController.clear();
      addressController.clear();
      selectedOption.value = '';
      passwordStudentController.clear();
      genderController.clear();
      update();
      Get.snackbar('Berhasil', 'Data siswa berhasil ditambahkan',
          backgroundColor: successColor, colorText: whiteColor);
    } catch (e) {
      Get.snackbar('Gagal', '$e',
          backgroundColor: dangerColor, colorText: whiteColor);
      print(e);
    }
  }
}
