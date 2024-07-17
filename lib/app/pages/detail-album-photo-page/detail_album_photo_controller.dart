import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-by-id-album/show_by_id_album_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/service/albums_service.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/service/photos_service.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailAlbumPhotoPageController extends GetxController {
  final GalleryPageController galleryPageController =
      Get.put(GalleryPageController());
  AlbumsService albumsService = AlbumsService();
  PhotosService photosService = PhotosService();
  ShowByIdAlbumResponse? showByIdAlbumResponse;
  Rx<ShowAllAlbumsModel> showAllAlbumsModel = ShowAllAlbumsModel().obs;

  @override
  void onInit() {
    super.onInit();
    showByIdAlbum(Get.arguments);
    print(Get.arguments);
  }

  Future showByIdAlbum(String albumId) async {
    try {
      final response = await albumsService.getShowByIdAlbum(albumId);
      showByIdAlbumResponse = ShowByIdAlbumResponse.fromJson(response.data);
      showAllAlbumsModel.value = showByIdAlbumResponse!.data;
      print(showAllAlbumsModel.value);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('albumId', albumId);
      update();
    } catch (e) {
      print(e);
    }
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
      Get.offAllNamed(Routes.NAVBAR_MAIN, arguments: 2);
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

  Future savePhotoToGallery(String url) async {
    try {
      var response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "downloaded_image",
      );
      if (result['isSuccess']) {
        Get.snackbar("Success", "Photo saved to gallery");
      } else {
        Get.snackbar("Error", "Failed to save photo");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "An error occurred while saving the photo");
    }
  }

  Future deletePhotoByAdmin(String idPhoto) async {
    try {
      final response = await photosService.deletePhotoByAdmin(idPhoto);
      print(response.data);
      galleryPageController.showAllPhotos();
      galleryPageController.showAllAlbums();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      showByIdAlbum(prefs.getString('albumId')!);

      update();
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
