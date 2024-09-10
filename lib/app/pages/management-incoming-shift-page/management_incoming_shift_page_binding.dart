import 'package:fun_education_app_teacher/app/pages/management-incoming-shift-page/management_incoming_shift_page_controller.dart';
import 'package:get/get.dart';

class ManagementIncomingShiftPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagementIncomingShiftPageController>(
        () => ManagementIncomingShiftPageController());
  }
}
