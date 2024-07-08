import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:get/get.dart';

class AddReportPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddReportPageController>(() => AddReportPageController());
  }
}