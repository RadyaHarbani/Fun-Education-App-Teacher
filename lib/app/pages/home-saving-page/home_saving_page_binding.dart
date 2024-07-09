import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_controller.dart';
import 'package:get/get.dart';

class HomeSavingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSavingPageController>(() => HomeSavingPageController());
  }
}