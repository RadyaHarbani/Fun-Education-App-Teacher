import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:get/get.dart';

class DetailReportPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailReportPageController>(() => DetailReportPageController());
  }
}