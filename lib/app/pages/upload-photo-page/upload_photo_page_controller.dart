import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/service/albums_service.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/service/photos_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPhotoPageController extends GetxController {
  TextEditingController photoTitleController = TextEditingController();
  TextEditingController photoDescriptionController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  RxString albumId = ''.obs;

  PhotosService photosService = PhotosService();
  ShowAllPhotosResponse? showAllPhotosResponse;
  RxList<ShowAllPhotosModel> showAllPhotosModel = <ShowAllPhotosModel>[].obs;

  AlbumsService albumsService = AlbumsService();
  ShowAllAlbumsResponse? showAllAlbumsResponse;
  RxList<ShowAllAlbumsModel> showAllAlbumsModel = <ShowAllAlbumsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showAllAlbums();
  }

  void selectImage() async {
    final List<XFile>? selectedImage = await imagePicker.pickMultiImage();
    if (selectedImage != null && selectedImage.isNotEmpty) {
      imageFileList.addAll(selectedImage);
    }
  }

  void deleteImage(int index) {
    imageFileList.removeAt(index);
  }

  Future showAllPhotos() async {
    try {
      final response = await photosService.getShowAllPhotos();
      showAllPhotosResponse = ShowAllPhotosResponse.fromJson(response.data);
      showAllPhotosModel.value = showAllPhotosResponse!.data;
      print(showAllPhotosModel);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> storePhotoByAdmin() async {
    String title = photoTitleController.text;
    String description = photoDescriptionController.text;
    String? selectedAlbumValue = albumId.value;
    List<File> files = imageFileList.map((xfile) => File(xfile.path)).toList();

    try {
      for (var file in files) {
        final response = await photosService.postStorePhotoByAdmin(
          albumId.isNotEmpty ? true : false,
          file,
          title,
          description,
          selectedAlbumValue,
        );
        print('Upload successful: ${response.data}');
      }

      Get.snackbar(
        'Upload Successful',
        'Foto berhasil ditambahkan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      update();
      showAllPhotos();
      Get.offAllNamed(Routes.NAVBAR_MAIN, arguments: 2);
    } catch (e) {
      print('Upload failed: $e');
      Get.snackbar(
        'Upload Failed',
        'Foto gagal ditambahkan',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
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
}
