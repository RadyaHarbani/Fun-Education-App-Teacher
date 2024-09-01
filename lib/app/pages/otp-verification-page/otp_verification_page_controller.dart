import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class OtpVerificationPageController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
  RxBool isLoadingVerifyOtp = false.obs;
  RxBool isLoadingResendOTP = false.obs;
  TextEditingController otpController = TextEditingController();
  var emailVerify = ''.obs;
  var tokenResetPassword = ''.obs;
  RxString countDown = '00:00'.obs;
  RxInt count = 300.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    emailVerify.value = Get.arguments;
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (Timer t) {
      if (count.value == 0) {
        t.cancel();
        countDown.value = 'time out';
      } else {
        count.value--;
        int minute = count.value ~/ 60;
        int second = count.value % 60;
        countDown.value =
            '${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
      }
    });
  }

  void resetAndStartTimer() {
    count.value = 300;
    countDown.value = '05:00';
    timer?.cancel();
    startTimer();
  }

  Future<void> verifyOtp() async {
    if (otpController.text.length == 4) {
      try {
        isLoadingVerifyOtp(true);
        final response = await authenticationService.postVerifyOtp(
          emailVerify.value,
          otpController.text,
        );
        tokenResetPassword.value = response.data['token_reset_password'];
        isLoadingVerifyOtp(false);
        Get.toNamed(
          Routes.RESET_PASSWORD_PAGE,
          arguments: {
            'tokenResetPassword': tokenResetPassword.value,
            'emailVerify': emailVerify.value,
          },
        );
        Get.snackbar(
          "Success",
          "OTP successful",
          backgroundColor: successColor,
          colorText: whiteColor,
        );
      } catch (e) {
        isLoadingVerifyOtp(false);
        print(e);
        Get.snackbar(
          'Kode Otp Salah',
          'Kode OTP yang Anda masukkan salah',
          backgroundColor: dangerColor,
          colorText: whiteColor,
        );
      }
    } else {
      isLoadingVerifyOtp(false);
      Get.snackbar(
        'Kode Otp Salah',
        'Kode OTP yang Anda masukkan salah',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }

  Future<void> resendOtp() async {
    try {
      isLoadingResendOTP(true);
      await authenticationService.postSendOtp(
        emailVerify.value,
      );
      isLoadingResendOTP(false);
      Get.snackbar(
        "Success",
        "Send OTP successful",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      resetAndStartTimer();
    } catch (e) {
      isLoadingResendOTP(false);
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: dangerColor,
        colorText: whiteColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void stopTimer() {
    timer?.cancel();
  }
}
