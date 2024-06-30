import 'package:fun_education_app_teacher/app/pages/edit-task-page/edit_task_page_controller.dart';
import 'package:get/get.dart';

class EditTaskPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditTaskPageController>(() => EditTaskPageController());
  }
}
