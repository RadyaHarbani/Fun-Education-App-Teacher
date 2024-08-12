import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_controller.dart';
import 'package:get/get.dart';

class UnverifiedStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnverifiedStudentPageController>(() => UnverifiedStudentPageController());
  }
}
