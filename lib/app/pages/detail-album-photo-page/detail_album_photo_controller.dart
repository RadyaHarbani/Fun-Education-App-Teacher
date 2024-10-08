import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-by-id-album/show_by_id_album_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/service/albums_service.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/service/photos_service.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailAlbumPhotoPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  final GalleryPageController galleryPageController =
      Get.put(GalleryPageController());
  AlbumsService albumsService = AlbumsService();
  PhotosService photosService = PhotosService();
  ShowByIdAlbumResponse? showByIdAlbumResponse;
  Rx<ShowAllAlbumsModel> showAllAlbumsModel = ShowAllAlbumsModel().obs;
  RxBool isLoadingSavePhoto = false.obs;
  RxBool isLoadingDeletePhoto = false.obs;
  RxBool isLoadingShowByIdAlbum = false.obs;

  @override
  void onInit() {
    super.onInit();
    showByIdAlbum(Get.arguments);
  }

  Future showByIdAlbum(String albumId) async {
    try {
      isLoadingShowByIdAlbum(true);
      final response = await albumsService.getShowByIdAlbum(albumId);
      showByIdAlbumResponse = ShowByIdAlbumResponse.fromJson(response.data);
      showAllAlbumsModel.value = showByIdAlbumResponse!.data;
      print(showAllAlbumsModel.value);

      final photoIds = showAllAlbumsModel.value.gallery!
          .map((photo) => photo.id)
          .whereType<String>()
          .toList();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('photoIds', photoIds);
      prefs.setString('albumId', albumId);
      isLoadingShowByIdAlbum(false);
      update();
    } catch (e) {
      isLoadingShowByIdAlbum(false);
      print(e);
    }
  }

  Future deleteAlbumByAdmin(String albumId) async {
    try {
      final album = galleryPageController.showAllAlbumsModel
          .firstWhereOrNull((album) => album.id == albumId);
      if (album == null) {
        print('Album not found');
        return;
      }

      if (album.gallery != null) {
        for (var photo in album.gallery!) {
          await photosService.deletePhotoByAdmin(photo.id!);
          print('Photo deleted: ${photo.id}');
        }
      }

      final response = await albumsService.deleteAlbumByAdmin(albumId);
      print('Album deleted: ${response.data}');

      await galleryPageController.showAllPhotos();
      await galleryPageController.showAllAlbums();

      Get.back();
      Get.snackbar(
        'Delete Successful',
        'Album berhasil dihapus',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      update();
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
      isLoadingSavePhoto(true);
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
        update();
        Get.back();
        isLoadingSavePhoto(false);
        Get.snackbar("Success", "Photo saved to gallery");
      } else {
        isLoadingSavePhoto(false);
        Get.snackbar("Error", "Failed to save photo");
      }
    } catch (e) {
      isLoadingSavePhoto(false);
      print(e);
      Get.snackbar("Error", "An error occurred while saving the photo");
    }
  }

  Future deletePhotoByAdmin(String idPhoto) async {
    try {
      isLoadingDeletePhoto(true);
      final response = await photosService.deletePhotoByAdmin(idPhoto);
      print(response.data);

      await galleryPageController.showAllPhotos();
      await galleryPageController.showAllAlbums();

      SharedPreferences prefs = await SharedPreferences.getInstance();
      showByIdAlbum(prefs.getString('albumId')!);

      update();
      Get.back();
      isLoadingDeletePhoto(false);
    } catch (e) {
      isLoadingDeletePhoto(false);
      print(e);
    }
  }
}
