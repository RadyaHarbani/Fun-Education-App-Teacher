import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:get/get.dart';

class DetailClassPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailClassPageController>(() => DetailClassPageController());
  }
}
