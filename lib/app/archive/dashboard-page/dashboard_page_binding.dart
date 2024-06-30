import 'package:fun_education_app_teacher/app/archive/dashboard-page/dashboard_page_controller.dart';
import 'package:get/get.dart';

class DashboardPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardPageController>(() => DashboardPageController());
  }
}