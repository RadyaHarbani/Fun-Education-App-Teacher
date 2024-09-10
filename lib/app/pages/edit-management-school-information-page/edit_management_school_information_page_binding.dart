import 'package:fun_education_app_teacher/app/pages/edit-management-school-information-page/edit_management_school_information_page_controller.dart';
import 'package:get/get.dart';

class EditManagementSchoolInformationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditManagementSchoolInformationPageController>(
        () => EditManagementSchoolInformationPageController());
  }
}
