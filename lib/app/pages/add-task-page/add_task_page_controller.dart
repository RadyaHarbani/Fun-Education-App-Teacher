import 'dart:io';
import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_model.dart';
import 'package:fun_education_app_teacher/app/api/task/service/task_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddTaskPageController extends GetxController {
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  TaskService taskService = TaskService();
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  var selectedType = ''.obs;
  final ImagePicker imagePicker = ImagePicker();
  var imageFileList = <XFile>[].obs;
  var selectedDateTime = DateTime.now().obs;
  var incomingShift = ''.obs;

  @override
  void onInit() {
    super.onInit();
    incomingShift.value = Get.arguments;
    print(incomingShift);
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
      minimumDate: DateTime.now(),
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
      print(value);
    }
  }

  Future<void> storeTaskByAdmin() async {
    try {
      final formattedDate =
          DateFormat('yyyy-MM-dd').format(selectedDateTime.value);
      final response = await taskService.postStoreTaskByAdmin(
        selectedType.value,
        taskNameController.text,
        taskDescriptionController.text,
        formattedDate.toString(),
        incomingShift.value,
      );

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

      final id = response.data['data']['id'];
      final createdAtString = response.data['data']['created_at'];

      DateTime? createdAt;
      try {
        createdAt = DateTime.parse(createdAtString);
      } catch (e) {
        print('Failed to parse createdAt: $e');
        createdAt = null;
      }

      ShowByStatusModel showByStatusModel = ShowByStatusModel(
        id: id,
        category: selectedType.value,
        title: taskNameController.text,
        deadline: selectedDateTime.value,
        shift: incomingShift.value,
        createdAt: createdAt,
      );

      detailClassPageController.showByNewStatusList.add(showByStatusModel);
      await detailClassPageController.showStatusCount(incomingShift.value);

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
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e);
    }
  }
}
