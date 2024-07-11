import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late AuthenticationService authenticationService;
  RxBool isObsecure = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    authenticationService = AuthenticationService();
  }

  Future<void> login() async {
    try {
      isLoading(true);
      final response = await authenticationService.login(
          usernameController.text, passwordController.text);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.NAVBAR_MAIN);
    } catch (e) {
      isLoading(true);
      Get.snackbar("Login Error", "Invalid Username or Password");
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
