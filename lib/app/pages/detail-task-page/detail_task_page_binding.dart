import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:get/get.dart';

class DetailTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTaskPageController>(() => DetailTaskPageController());
  }
}
