import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/albums/service/albums_service.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_model.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_response.dart';
import 'package:fun_education_app_teacher/app/api/gallery/photos/service/photos_service.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UploadPhotoPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  final GalleryPageController galleryPageController =
      Get.put(GalleryPageController());
  TextEditingController photoTitleController = TextEditingController();
  TextEditingController photoDescriptionController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  RxString albumId = ''.obs;
  RxBool isLoadingUploadPhoto = false.obs;
  RxBool isLoadingFetchAlbum = false.obs;

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

  Future<void> storePhotoByAdmin() async {
    
    String title = photoTitleController.text.trim();
    String description = photoDescriptionController.text.trim();
    String? selectedAlbumValue =
        albumId.value.isNotEmpty ? albumId.value : null;
    List<File> files = imageFileList.map((xfile) => File(xfile.path)).toList();

    if (title.isEmpty || description.isEmpty || files.isEmpty) {
      isLoadingUploadPhoto(false);
      Get.snackbar(
        'Upload Failed',
        'Title, description, and images cannot be empty',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
      return;
    }

    try {
      isLoadingUploadPhoto(true);
      for (var file in files) {
        final response = await photosService.postStorePhotoByAdmin(
          selectedAlbumValue != null,
          file,
          title,
          description,
          selectedAlbumValue,
        );
        print('Upload successful: ${response.data}');

        final responseData = response.data;
        final image = responseData['data']['image'].toString();
        final createdAtString = responseData['data']['created_at'];
        final id = responseData['data']['id'].toString();

        DateTime? createdAt;
        try {
          createdAt = DateTime.parse(createdAtString);
        } catch (e) {
          print('Failed to parse createdAt: $e');
          createdAt = null;
        }

        ShowAllPhotosModel addPhoto = ShowAllPhotosModel(
          albumId: selectedAlbumValue,
          title: title,
          description: description,
          image: image,
          createdAt: createdAt,
          id: id,
        );

        galleryPageController.showAllPhotosModel.add(addPhoto);

        if (selectedAlbumValue != null) {
          galleryPageController.updateGalleryCount(selectedAlbumValue, 1);
        }
      }
      update();
      Get.back();
      isLoadingUploadPhoto(false);
      Get.snackbar(
        'Upload Successful',
        'Foto berhasil ditambahkan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      isLoadingUploadPhoto(false);
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
      isLoadingFetchAlbum(true);
      final response = await albumsService.getShowAllAlbumPhoto();
      showAllAlbumsResponse = ShowAllAlbumsResponse.fromJson(response.data);
      showAllAlbumsModel.value = showAllAlbumsResponse!.data;
      isLoadingFetchAlbum(false);
      update();
    } catch (e) {
      isLoadingFetchAlbum(false);
      print(e);
    }
  }
}
