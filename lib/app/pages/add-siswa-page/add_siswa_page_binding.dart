import 'package:fun_education_app_teacher/app/pages/add-siswa-page/add_siswa_page_controller.dart';
import 'package:get/get.dart';

class AddSiswaPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSiswaPageController>(() => AddSiswaPageController());
  }
}