import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileDrawerController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
  Future<void> logout() async {
    await authenticationService.logout();
    Get.offAllNamed(Routes.LOGIN_PAGE);
  }
}
