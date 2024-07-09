import 'package:fun_education_app_teacher/app/pages/detail-album-photo-page/detail_album_photo_controller.dart';
import 'package:get/get.dart';

class DetailAlbumPhotoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailAlbumPhotoPageController>(
      () => DetailAlbumPhotoPageController(),
    );
  }
}
