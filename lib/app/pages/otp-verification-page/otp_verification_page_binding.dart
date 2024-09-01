
import 'package:fun_education_app_teacher/app/pages/otp-verification-page/otp_verification_page_controller.dart';
import 'package:get/get.dart';

class OtpVerificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpVerificationPageController>(() => OtpVerificationPageController());
  }
}