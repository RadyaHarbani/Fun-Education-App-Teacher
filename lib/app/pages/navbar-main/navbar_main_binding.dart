import 'package:fun_education_app_teacher/app/pages/navbar-main/navbar_main_controller.dart';
import 'package:get/get.dart';

class NavbarMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarMainController>(() => NavbarMainController());
  }
}