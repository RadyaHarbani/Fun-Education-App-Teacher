import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/selected_student_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user/show_user_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user/show_user_response.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddReportPageController extends GetxController {
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  TextEditingController teachersNote = TextEditingController();
  List<String> pointType = ['A', 'B', 'C'];
  List<RxString> points = List.generate(10, (_) => 'A'.obs);
  DailyReportService dailyReportService = DailyReportService();
  ShowUserResponse? showUserResponse;
  RxList<ShowUserModel> showUserModel = <ShowUserModel>[].obs;
  RxList<SelectedStudentModel> selectedStudents = <SelectedStudentModel>[].obs;
  List<String> pointNames = [
    'Datang Tepat Pada Waktunya',
    'Berpakaian Rapi',
    'Berbuat Baik Dengan Teman',
    'Mau Menolong dan Berbagi Dengan Teman',
    'Merapikan Alat Belajar dan Mainan Sendiri',
    'Menyelesaikan Tugas',
    'Membaca',
    'Menulis',
    'Dikte',
    'Keterampilan'
  ];

  @override
  void onInit() {
    super.onInit();
    showUserDoneUndone('false', Get.arguments);
    print(Get.arguments);
  }

  Future showUserDoneUndone(String isDone, String shift) async {
    try {
      final response =
          await dailyReportService.getShowUserDoneUndone(isDone, shift);
      showUserResponse = ShowUserResponse.fromJson(response.data);
      showUserModel.value = showUserResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  void toggleRecipient(ShowUserModel recipient) {
    final existingStudent =
        selectedStudents.firstWhereOrNull((s) => s.id == recipient.id);
    if (existingStudent != null) {
      selectedStudents.remove(existingStudent);
    } else {
      selectedStudents.add(SelectedStudentModel(
        id: recipient.id!,
        fullName: recipient.fullName!,
        profilePicture: recipient.profilePicture!,
      ));
    }
  }

  Future<void> storeDailyReportByAdmin() async {
    try {
      Map<String, String> activities = {
        for (int i = 0; i < points.length; i++)
          'activity_${i + 1}': points[i].value,
      };

      for (SelectedStudentModel student in selectedStudents) {
        final response = await dailyReportService.postStoreDailyReportByAdmin(
          teachersNote.text.isNotEmpty ? true : false,
          student.id,
          activities,
          teachersNote.text,
        );
        if (response.statusCode == 201) {
          print("Report for ${student.id} submitted successfully");
        } else {
          print(
              "Failed to submit report for ${student.id}: ${response.statusCode}");
        }
        ShowUserModel addUser = ShowUserModel(
          id: student.id,
          fullName: student.fullName,
          profilePicture: student.profilePicture,
        );

        detailClassPageController.showUserModel.add(addUser);
      }
      Get.back();

      Get.snackbar(
        'Upload Successful',
        'Laporan berhasil ditambahkan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );

      update();
    } catch (e) {
      print('Upload failed: $e');
      Get.snackbar(
        'Upload Failed',
        'Laporan gagal ditambahkan',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
