import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ResetPasswordPageController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
  RxBool isVisibleSignIn = true.obs;
  RxBool isVisibleSignInConfirm = true.obs;
  RxBool isLoadingResetPassword = false.obs;
  var tokenResetPassword = ''.obs;
  var emailVerify = ''.obs;
  final GlobalKey<FormState> formKeyConfirmResetPassword =
      GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    tokenResetPassword.value = Get.arguments['tokenResetPassword'];
    emailVerify.value = Get.arguments['emailVerify'];
  }

  Future<void> updateResetPassword() async {
    try {
      isLoadingResetPassword(true);
      final response = await authenticationService.putResetPassword(
        emailVerify.value,
        tokenResetPassword.value,
        confirmPasswordController.text,
      );
      final message = response.statusMessage;
      isLoadingResetPassword(false);
      Get.snackbar(
        "Success",
        message ?? "Reset password successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.LOGIN_PAGE);
    } catch (e) {
      isLoadingResetPassword(false);
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
