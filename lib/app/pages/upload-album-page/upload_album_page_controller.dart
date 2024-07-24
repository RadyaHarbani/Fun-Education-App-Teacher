import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/service/albums_service.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadAlbumPageController extends GetxController {
  final GalleryPageController galleryPageController =
      Get.put(GalleryPageController());
  TextEditingController albumTitleController = TextEditingController();
  TextEditingController albumDescriptionController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  var fileimagePath = ''.obs;

  AlbumsService albumsService = AlbumsService();
  ShowAllAlbumsResponse? showAllAlbumsResponse;
  RxList<ShowAllAlbumsModel> showAllAlbumsModel = <ShowAllAlbumsModel>[].obs;

  void selectImage() async {
    final List<XFile>? selectedImage = await imagePicker.pickMultiImage();
    if (selectedImage != null && selectedImage.isNotEmpty) {
      imageFileList.addAll(selectedImage);
    }
  }

  void selectOneImage() async {
    final XFile? selectedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      fileimagePath.value = selectedImage.path;
    }
  }

  void deleteImage(int index) {
    imageFileList.removeAt(index);
  }

  Future showAllAlbums() async {
    try {
      final response = await albumsService.getShowAllAlbumPhoto();
      showAllAlbumsResponse = ShowAllAlbumsResponse.fromJson(response.data);
      showAllAlbumsModel.value = showAllAlbumsResponse!.data;
      print(showAllAlbumsModel);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> storeAlbumByAdmin() async {
    try {
      final response = await albumsService.postStoreAlbumByAdmin(
        albumTitleController.text,
        albumDescriptionController.text,
        fileimagePath.value,
      );

      final responseData = response.data;
      final albumId = responseData['data']['id'];
      final albumCover = responseData['data']['cover'];
      final galleryCount = 0;

      ShowAllAlbumsModel newAlbum = ShowAllAlbumsModel(
        id: albumId,
        name: albumTitleController.text,
        desc: albumDescriptionController.text,
        cover: albumCover,
        galleryCount: galleryCount,
      );

      galleryPageController.showAllAlbumsModel.add(newAlbum);

      List<File> files =
          imageFileList.map((xfile) => File(xfile.path)).toList();
      int addedPhotosCount = 0;
      for (var file in files) {
        final response = await albumsService.postStoreAlbumPhotoByAdmin(
          file,
          albumTitleController.text,
          albumDescriptionController.text,
          albumId,
        );
        print('Upload successful: ${response.data}');
        addedPhotosCount++;
      }

      galleryPageController.updateGalleryCount(albumId, addedPhotosCount);

      await galleryPageController.showAllPhotos();

      Get.back();

      Get.snackbar(
        'Upload Successful',
        'Album berhasil ditambahkan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );

      update();
    } catch (e) {
      Get.snackbar(
        'Upload Failed',
        'Album gagal ditambahkan',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
      print(e);
    }
  }
}
