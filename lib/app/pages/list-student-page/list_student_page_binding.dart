import 'package:fun_education_app_teacher/app/pages/list-student-page/list_student_page_controller.dart';
import 'package:get/get.dart';

class ListStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListStudentPageController>(() => ListStudentPageController());
  }
}