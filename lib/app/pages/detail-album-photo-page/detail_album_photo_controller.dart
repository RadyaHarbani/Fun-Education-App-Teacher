import 'package:fun_education_app_teacher/app/api/gallery/albums/service/albums_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class DetailAlbumPhotoPageController extends GetxController {
  AlbumsService albumsService = AlbumsService();
  @override
  void onInit() {
    super.onInit();
  }

  Future deleteAlbumByAdmin(String albumId) async {
    try {
      final response = await albumsService.deleteAlbumByAdmin(albumId);
      print('Album deleted: ${response.data}');
      Get.snackbar(
        'Delete Successfull',
        'Album berhasil dihapus',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      Get.offAllNamed(Routes.GALLERY_PAGE);
    } catch (e) {
      print('Delete failed: $e');
      Get.snackbar(
        'Delete Failed',
        'Album gagal dihapus',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
