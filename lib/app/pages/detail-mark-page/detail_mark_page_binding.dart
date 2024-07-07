import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_controller.dart';
import 'package:get/get.dart';

class DetailMarkPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMarkPageController>(() => DetailMarkPageController());
  }
}