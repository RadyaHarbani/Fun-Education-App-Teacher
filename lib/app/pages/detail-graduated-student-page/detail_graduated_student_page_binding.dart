import 'package:fun_education_app_teacher/app/pages/detail-graduated-student-page/detail_graduated_student_page_controller.dart';
import 'package:get/get.dart';

class DetailGraduatedStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailGraduatedStudentPageController>(() => DetailGraduatedStudentPageController());
  }
}
