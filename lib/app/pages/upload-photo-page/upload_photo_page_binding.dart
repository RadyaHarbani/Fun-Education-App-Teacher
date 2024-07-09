import 'package:fun_education_app_teacher/app/pages/upload-photo-page/upload_photo_page_controller.dart';
import 'package:get/get.dart';

class UploadPhotoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadPhotoPageController>(() => UploadPhotoPageController());
  }
}