import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadAlbumPageController extends GetxController {
  TextEditingController albumTitleController = TextEditingController();
  TextEditingController albumDescriptionController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  var fileimagePath = ''.obs;

  void selectImage() async {
    final List<XFile>? selectedImage = await imagePicker.pickMultiImage();
    if (selectedImage != null && selectedImage.isNotEmpty) {
      imageFileList.addAll(selectedImage);
    }
  }

  void selectOneImage() async {
    final XFile? selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      fileimagePath.value = selectedImage.path;
    }
  }

  void deleteImage(int index) {
    imageFileList.removeAt(index);
  }
}