import 'package:fun_education_app_teacher/app/pages/add-management-school-information-page/add_management_school_information_page_controller.dart';
import 'package:get/get.dart';

class AddManagementSchoolInformationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddManagementSchoolInformationPageController>(() => AddManagementSchoolInformationPageController());
  }
}