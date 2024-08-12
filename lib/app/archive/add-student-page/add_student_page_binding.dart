import 'package:fun_education_app_teacher/app/archive/add-student-page/add_student_page_controller.dart';
import 'package:get/get.dart';

class AddStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddStudentPageController>(() => AddStudentPageController());
  }
}
