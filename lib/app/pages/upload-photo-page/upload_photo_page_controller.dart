import 'package:flutter/material.dart';
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

  PhotosService photosService = PhotosService();
  ShowAllPhotosResponse? showAllPhotosResponse;
  RxList<ShowAllPhotosModel> showAllPhotosModel = <ShowAllPhotosModel>[].obs;

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
    List<File> files = imageFileList.map((xfile) => File(xfile.path)).toList();

    for (var file in files) {
      try {
        final response =
            await photosService.postStorePhotoByAdmin(file, title, description);
        print('Upload successful: ${response.data}');
        Get.snackbar(
          'Upload Successfull',
          'Foto berhasil ditambahkan',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
        showAllPhotos();
        Get.offAllNamed(Routes.GALLERY_PAGE);
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
  }
}
