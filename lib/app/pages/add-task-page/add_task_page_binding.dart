import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_controller.dart';
import 'package:get/get.dart';

class AddTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTaskPageController>(() => AddTaskPageController());
  }
}
