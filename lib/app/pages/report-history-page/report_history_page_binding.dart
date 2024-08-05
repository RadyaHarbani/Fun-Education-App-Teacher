import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:get/get.dart';

class ReportHistoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportHistoryPageController>(() => ReportHistoryPageController());
  }
}