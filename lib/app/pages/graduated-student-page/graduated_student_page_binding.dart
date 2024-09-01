import 'package:fun_education_app_teacher/app/pages/graduated-student-page/graduated_student_page_controller.dart';
import 'package:get/get.dart';

class GraduatedStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GraduatedStudentPageController>(() => GraduatedStudentPageController());
  }
}
