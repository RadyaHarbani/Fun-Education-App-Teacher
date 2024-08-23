import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/selected_student_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user-done-undone/show_user_done_undone_model.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user-done-undone/show_user_done_undone_response.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddReportPageController extends GetxController {
  var selectedPermission = 'Hadir'.obs;
  RefreshController refreshController = RefreshController();
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  TextEditingController teachersNote = TextEditingController();
  List<String> pointType = ['A', 'B', 'C'];
  List<RxString> points = List.generate(10, (_) => 'A'.obs);
  DailyReportService dailyReportService = DailyReportService();
  ShowUserDoneUndoneResponse? showUserDoneUndoneResponse;
  RxList<ShowUserDoneUndoneModel> showUserUndoneModel =
      <ShowUserDoneUndoneModel>[].obs;
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
      showUserDoneUndoneResponse =
          ShowUserDoneUndoneResponse.fromJson(response.data);
      showUserUndoneModel.value = showUserDoneUndoneResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  void toggleRecipient(ShowUserDoneUndoneModel recipient) {
    final existingStudent =
        selectedStudents.firstWhereOrNull((s) => s.id == recipient.id);
    if (existingStudent != null) {
      selectedStudents.remove(existingStudent);
    } else {
      if (recipient.id != null &&
          recipient.fullName != null &&
          recipient.profilePicture != null) {
        selectedStudents.add(SelectedStudentModel(
          id: recipient.id!,
          fullName: recipient.fullName!,
          profilePicture: recipient.profilePicture!,
          permission: selectedPermission.value,
        ));
      } else {
        print("Error: Missing required recipient fields");
      }
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
          selectedPermission.value == 'Hadir' ? true : false,
          teachersNote.text.isNotEmpty ? true : false,
          student.id,
          activities,
          selectedPermission.value,
          teachersNote.text,
        );
        if (response.statusCode == 201) {
          print("Report for ${student.id} submitted successfully");
        } else {
          print(
              "Failed to submit report for ${student.id}: ${response.statusCode}");
        }
        ShowUserDoneUndoneModel addUser = ShowUserDoneUndoneModel(
          id: student.id,
          fullName: student.fullName,
          profilePicture: student.profilePicture,
          permission: student.permission,
        );

        detailClassPageController.showUserDoneModel.add(addUser);
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
