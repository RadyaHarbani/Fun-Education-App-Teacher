import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_controller.dart';
import 'package:get/get.dart';

class ProfileDrawerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDrawerController>(() => ProfileDrawerController());
  }
}