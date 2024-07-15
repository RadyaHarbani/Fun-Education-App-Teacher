import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
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

  Future<void> register() async {
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
      if (response.statusCode == 201) {
        print("Registrasi berhasil");
        Get.snackbar(
          'Berhasil',
          'Registrasi berhasil',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
        Get.offAllNamed(Routes.NAVBAR_MAIN);
      } else {
        Get.snackbar(
          'Gagal',
          'Registrasi gagal. Status kode: ${response.statusCode}',
          backgroundColor: dangerColor,
          colorText: whiteColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Terjadi kesalahan: $e',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
      print(e);
    }
  }
}
