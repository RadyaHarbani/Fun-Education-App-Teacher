import 'package:fun_education_app_teacher/app/pages/detail-unverified-student-page/detail_unverified_student_page_controller.dart';
import 'package:get/get.dart';

class DetailUnverifiedStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailUnverifiedStudentPageController>(() => DetailUnverifiedStudentPageController());
  }
}
