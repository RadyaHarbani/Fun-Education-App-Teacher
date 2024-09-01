import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyEmailReset = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailResetController = TextEditingController();
  late AuthenticationService authenticationService;
  RxBool isObsecure = true.obs;
  RxBool isLoadingLogin = false.obs;
  RxBool isLoadingEmailReset = false.obs;
  var saveEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.text = 'funeducationapp@gmail.com';
    passwordController.text = 'tuticaidahguru1';
    authenticationService = AuthenticationService();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoadingLogin(true);
        final response = await authenticationService.login(
          emailController.text,
          passwordController.text,
        );

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('teachersToken', response.data['token']);

        Get.snackbar("Login Success", "Welcome Back!");
        Get.offAllNamed(Routes.NAVBAR_MAIN, arguments: 0);
      } catch (e) {
        isLoadingLogin(true);
        Get.snackbar("Login Error", "Invalid Username or Password");
        print(e);
      } finally {
        isLoadingLogin(false);
      }
    }
  }

  Future<void> checkEmailExist() async {
    if (formKeyEmailReset.currentState!.validate()) {
      try {
        isLoadingEmailReset(true);
        await authenticationService.checkEmailExist(
          emailResetController.text,
        );
        saveEmail.value = emailResetController.text;
        await authenticationService.postSendOtp(saveEmail.value);
        Get.toNamed(Routes.OTP_VERIFICATION_PAGE, arguments: saveEmail.value);
        isLoadingEmailReset(false);
        Get.snackbar("Success", "Email Exist");
      } catch (e) {
        isLoadingEmailReset(false);
        Get.snackbar("Error", "Something went wrong");
        print(e);
      }
    }
  }
}
