import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:get/get.dart';

class DetailListStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailListStudentPageController>(() => DetailListStudentPageController());
  }
}