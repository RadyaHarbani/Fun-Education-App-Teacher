import 'package:fun_education_app_teacher/app/pages/management-school-information-page/management_school_information_page_controller.dart';
import 'package:get/get.dart';

class ManagementSchoolInformationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagementSchoolInformationPageController>(
        () => ManagementSchoolInformationPageController());
  }
}
