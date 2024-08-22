import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthenticationService authenticationService;
  RxBool isObsecure = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.text = 'funeducationapp@gmail.com';
    passwordController.text = 'tuticaidahguru1';
    authenticationService = AuthenticationService();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
        emailController.text,
        passwordController.text,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('teachersToken', response.data['token']);

      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.NAVBAR_MAIN, arguments: 0);
    } catch (e) {
      isLoading(true);
      Get.snackbar("Login Error", "Invalid Username or Password");
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
