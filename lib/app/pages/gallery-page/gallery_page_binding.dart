import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:get/get.dart';

class GalleryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GalleryPageController>(
      () => GalleryPageController()
    );
  }
}