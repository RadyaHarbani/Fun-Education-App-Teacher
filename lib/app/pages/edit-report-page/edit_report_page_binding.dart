import 'package:fun_education_app_teacher/app/pages/edit-report-page/edit_report_page_controller.dart';
import 'package:get/get.dart';

class EditReportPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditReportPageController>(() => EditReportPageController());
  }
}