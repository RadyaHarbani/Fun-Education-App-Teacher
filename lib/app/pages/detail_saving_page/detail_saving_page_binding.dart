import 'package:fun_education_app_teacher/app/pages/detail_saving_page/detail_saving_page_controller.dart';
import 'package:get/get.dart';

class DetailSavingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailSavingPageController>(() => DetailSavingPageController());
  }
}