import 'package:fun_education_app_teacher/app/pages/upload-album-page/upload_album_page_controller.dart';
import 'package:get/get.dart';

class UploadAlbumPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadAlbumPageController>(() => UploadAlbumPageController());
  }
}