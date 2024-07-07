import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditTaskPageController extends GetxController{
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  var selectedType = ''.obs;
  final ImagePicker imagePicker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  var selectedDateTime = DateTime.now().obs;

  void selectType(String option) {
    selectedType.value = option;
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

  void selectDateTime(BuildContext context) async {
    final value = await showBoardDateTimePicker(
      context: context,
      pickerType: DateTimePickerType.date,
      initialDate: selectedDateTime.value,
      options: BoardDateTimeOptions(
        languages: BoardPickerLanguages(
          today: 'Hari ini',
          tomorrow: 'Besok',
          now: 'Sekarang',
          locale: 'id',
        ),
        startDayOfWeek: DateTime.monday,
        pickerFormat: PickerFormat.dmy,
        activeColor: primaryColor,
        backgroundDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        boardTitle: 'Pilih Tanggal',
        boardTitleTextStyle: tsBodyMediumSemibold(blackColor),
      ),
    );
    if (value != null) {
      selectedDateTime.value = value;
    }
  }
}