import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/service/albums_service.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/service/photos_service.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GalleryPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  RxBool isLoadingAllPhotos = false.obs;
  RxBool isLoadingAllAlbums = false.obs;

  PhotosService photosService = PhotosService();
  ShowAllPhotosResponse? showAllPhotosResponse;
  RxList<ShowAllPhotosModel> showAllPhotosModel = <ShowAllPhotosModel>[].obs;

  AlbumsService albumsService = AlbumsService();
  ShowAllAlbumsResponse? showAllAlbumsResponse;
  RxList<ShowAllAlbumsModel> showAllAlbumsModel = <ShowAllAlbumsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showAllPhotos();
    showAllAlbums();
  }

  Future showAllPhotos() async {
    try {
      isLoadingAllPhotos(true);
      final response = await photosService.getShowAllPhotos();
      showAllPhotosResponse = ShowAllPhotosResponse.fromJson(response.data);
      showAllPhotosModel.value = showAllPhotosResponse!.data;
      print(showAllPhotosModel);
      update();
    } catch (e) {
      isLoadingAllPhotos(true);
      print(e);
    } finally {
      isLoadingAllPhotos(false);
    }
  }

  Future showAllAlbums() async {
    try {
      isLoadingAllAlbums(true);
      final response = await albumsService.getShowAllAlbumPhoto();
      showAllAlbumsResponse = ShowAllAlbumsResponse.fromJson(response.data);
      showAllAlbumsModel.value = showAllAlbumsResponse!.data;
      print(showAllAlbumsModel);
      update();
    } catch (e) {
      isLoadingAllAlbums(true);
      print(e);
    } finally {
      isLoadingAllAlbums(false);
    }
  }

  void updateGalleryCount(String albumId, int count) {
    final album =
        showAllAlbumsModel.firstWhereOrNull((album) => album.id == albumId);
    if (album != null) {
      album.galleryCount = (album.galleryCount ?? 0) + count;
      showAllAlbumsModel.refresh();
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

  Future deletePhotoByAdmin(String idPhoto, String albumId) async {
    try {
      final response = await photosService.deletePhotoByAdmin(idPhoto);
      print(response.data);

      updateGalleryCount(albumId, -1);

      await showAllPhotos();
      await showAllAlbums();

      update();
      Get.back();
    } catch (e) {
      print(e);
    }
  }
}
