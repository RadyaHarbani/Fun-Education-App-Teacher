import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/edit_information_student_page_controller.dart';
import 'package:get/get.dart';

class EditInformationStudentPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditInformationStudentPageController>(() => EditInformationStudentPageController());
  }
}