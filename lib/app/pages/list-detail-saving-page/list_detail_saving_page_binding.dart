import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/list_detail_saving_page_controller.dart';
import 'package:get/get.dart';

class ListDetailSavingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListDetailSavingPageController>(() => ListDetailSavingPageController());
  }
}