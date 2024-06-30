import 'package:fun_education_app_teacher/app/archive/detail-kelas-page/detail_kelas_page_controller.dart';
import 'package:get/get.dart';

class DetailKelasPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKelasPageController>(() => DetailKelasPageController());
  }
}