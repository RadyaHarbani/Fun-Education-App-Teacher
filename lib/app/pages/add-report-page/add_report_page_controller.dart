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
  var selectedDate = DateTime.now().obs;
  var incomingShift = ''.obs;
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
  RxBool isLoadingAddReport = false.obs;
  RxBool isLoadingUserUndone = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedDate.value = Get.arguments['selectedDate'];
    incomingShift.value = Get.arguments['incomingShift'];
    showUserDoneUndone(
      'false',
      incomingShift.value,
      selectedDate.value,
    );
    print(Get.arguments);
  }

  Future showUserDoneUndone(String isDone, String shift, DateTime date) async {
    try {
      isLoadingUserUndone(true);
      final response =
          await dailyReportService.getShowUserDoneUndone(isDone, shift, date);
      showUserDoneUndoneResponse =
          ShowUserDoneUndoneResponse.fromJson(response.data);
      showUserUndoneModel.value = showUserDoneUndoneResponse!.data;
      isLoadingUserUndone(false);
      update();
    } catch (e) {
      isLoadingUserUndone(false);
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
      isLoadingAddReport(true);
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
          selectedDate.value,
        );
        if (response.statusCode == 201) {
          print("Report for ${student.id} submitted successfully");
          await detailClassPageController.showUserDone(
            'true',
            Get.arguments['incomingShift'],
            Get.arguments['selectedDate'],
          );
          await detailClassPageController.showUserUndone(
            'false',
            Get.arguments['incomingShift'],
            Get.arguments['selectedDate'],
          );
          isLoadingAddReport(false);
        } else {
          isLoadingAddReport(false);
          print(
              "Failed to submit report for ${student.id}: ${response.statusCode}");
        }
      }
      Get.back();
      update();
      Get.snackbar(
        'Upload Successful',
        'Laporan berhasil ditambahkan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      isLoadingAddReport(false);
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
