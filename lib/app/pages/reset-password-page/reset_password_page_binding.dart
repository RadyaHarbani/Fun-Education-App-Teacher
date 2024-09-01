import 'package:fun_education_app_teacher/app/pages/reset-password-page/reset_password_page_controller.dart';
import 'package:get/get.dart';

class ResetPasswordPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetPasswordPageController>(() => ResetPasswordPageController());
  }
}