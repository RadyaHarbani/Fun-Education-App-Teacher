import 'package:fun_education_app_teacher/app/api/auth/service/authentication_service.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileDrawerController extends GetxController {
  AuthenticationService authenticationService = AuthenticationService();
  RxBool isLoadingLogout = false.obs;
  Future<void> logout() async {
    isLoadingLogout(true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await authenticationService.logout();
    await prefs.remove('teachersToken');
    Get.offAllNamed(Routes.LOGIN_PAGE);
    isLoadingLogout(false);
  }
}
