import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user-password/show_current_user_model_password.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user-password/show_current_user_response_password.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/list-student-page/list_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditInformationStudentPageController extends GetxController {
  final DetailListStudentPageController detailListStudentPageController =
      Get.put(DetailListStudentPageController());
  final ListStudentPageController listStudentPageController =
      Get.put(ListStudentPageController());
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  UserService _userService = UserService();
  ShowCurrentUserResponsePassword? showCurrentUserResponsePassword;
  Rx<ShowCurrentUserModelPassword> showCurrentUserModelPassword =
      ShowCurrentUserModelPassword().obs;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString learningFlow = ''.obs;
  RxString userId = ''.obs;
  var isObsecure = true.obs;
  var selectedShift = ''.obs;
  var isGraduated = false.obs;
  RxBool isLoadingEditInformationStudent = false.obs;

  @override
  void onInit() {
    super.onInit();
    fullNameController.text = Get.arguments['fullName'];
    nickNameController.text = Get.arguments['nickName'];
    genderController.text = Get.arguments['gender'];
    placeOfBirthController.text = Get.arguments['birth'];
    addressController.text = Get.arguments['address'];
    selectedShift.value = Get.arguments['shift'];
    userId.value = Get.arguments['userId'];
    learningFlow.value = Get.arguments['learningFlow'];
  }

  Future updateUserByAdmin() async {
    try {
      isLoadingEditInformationStudent(true);
      await _userService.putUpdateUserByAdmin(
        passwordController.text.isNotEmpty ? true : false,
        learningFlow.value == 'C' ? true : false,
        userId.value,
        fullNameController.text,
        nickNameController.text,
        passwordController.text,
        placeOfBirthController.text,
        addressController.text,
        selectedShift.value,
        genderController.text,
        isGraduated.value,
      );

      await detailListStudentPageController.showByUserId(userId.value);
      await listStudentPageController
          .showAllUserByIncomingShift(selectedShift.value);
      await detailClassPageController
          .showAllUserByIncomingShift(selectedShift.value);
      await listStudentPageController
          .showAllUserByIncomingShift(Get.arguments['shift']);
      await detailClassPageController
          .showAllUserByIncomingShift(Get.arguments['shift']);

      Get.back();
      isLoadingEditInformationStudent(false);
      update();
      Get.snackbar(
        'Berhasil',
        'Data siswa berhasil diubah',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      isLoadingEditInformationStudent(false);
      print(e);
      Get.snackbar(
        'Gagal',
        'Data siswa gagal diubah',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    }
  }
}
