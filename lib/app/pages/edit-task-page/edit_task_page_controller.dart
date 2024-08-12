import 'dart:io';

import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/task/service/task_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditTaskPageController extends GetxController {
  final TaskService taskService = TaskService();
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  final DetailTaskPageController detailTaskPageController =
      Get.put(DetailTaskPageController());
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  var selectedType = ''.obs;
  final ImagePicker imagePicker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  var selectedDateTime = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    taskNameController.text = Get.arguments.title ?? '';
    taskDescriptionController.text = Get.arguments.description ?? '';
    selectedType.value = Get.arguments.category ?? '';
    selectedDateTime.value = Get.arguments.deadline ?? DateTime.now();
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
          color: whiteColor,
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

  Future deleteTaskImageByAdmin(String imageId) async {
    try {
      final response = await taskService.deleteTaskImageByAdmin(imageId);
      print(response.statusCode);
      await detailClassPageController.showByNewStatus(Get.arguments.shift);
      await detailTaskPageController.showByTaskId(Get.arguments.id);
    } catch (e) {
      print(e);
    }
  }

  Future updateTaskByAdmin() async {
    try {
      final response = await taskService.putUpdateTaskByAdmin(
        Get.arguments.id,
        selectedType.value,
        taskNameController.text,
        taskDescriptionController.text,
        Get.arguments.shift,
        DateFormat('yyyy-MM-dd').format(selectedDateTime.value),
      );
      print(response.statusCode);

      if (imageFileList.isNotEmpty) {
        final responseData = response.data;
        final taskId = responseData['data']['id'].toString();
        print('Task created with ID: $taskId');
        List<File> files =
            imageFileList.map((xfile) => File(xfile.path)).toList();

        for (var file in files) {
          final response = await taskService.postStoreTaskImageByAdmin(
            taskId,
            file,
          );
          print('Upload successful: ${response.data}');
        }
      }

      if (response.statusCode == 200) {
        await detailClassPageController.showByNewStatus(Get.arguments.shift);
        await detailTaskPageController.showByTaskId(Get.arguments.id);
        Get.back();
        Get.snackbar(
          'Berhasil',
          'Tugas berhasil diperbarui',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
      } else {
        Get.snackbar(
          'Error',
          'Terjadi kesalahan: ${response.statusCode}',
          backgroundColor: dangerColor,
          colorText: whiteColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan: $e',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
