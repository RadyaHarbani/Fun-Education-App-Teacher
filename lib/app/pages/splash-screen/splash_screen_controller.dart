import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2), () {
      SharedPreferences.getInstance().then((prefs) {
        final token = prefs.getString('teachersToken');
        if (token != null) {
          Get.offAllNamed(
            Routes.NAVBAR_MAIN,
            arguments: 0,
          );
        } else {
          Get.offAllNamed(Routes.LOGIN_PAGE);
        }
      });
    });
  }
}
