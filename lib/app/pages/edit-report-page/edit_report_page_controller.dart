import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditReportPageController extends GetxController {
  final DetailReportPageController detailReportPageController =
      Get.put(DetailReportPageController());
  DailyReportService dailyReportService = DailyReportService();
  TextEditingController teachersNote = TextEditingController();
  List<String> pointType = ['A', 'B', 'C'];
  List<RxString> points = [];
  RxString userFullName = ''.obs;
  RxString userId = ''.obs;
  RxString userDate = ''.obs;
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
    print(Get.arguments['userFullName']);
    userFullName.value = Get.arguments['userFullName'];
    teachersNote.text = Get.arguments['userNote'];
    userDate.value = DateFormat('yyyy-MM-dd').format(Get.arguments['userDate']);
    userId.value = Get.arguments['userId'];
    points =
        List.generate(10, (_) => '${Get.arguments['userGrade'][_].grade}'.obs);
  }

  Future updateDailyReportByAdmin() async {
    try {
      Map<String, String> activities = {
        for (int i = 0; i < points.length; i++)
          'activity_${i + 1}': points[i].value,
      };
      await dailyReportService.putUpdateDailyReportByAdmin(
        userDate.value,
        userId.value,
        activities,
        teachersNote.text,
      );
      await detailReportPageController.showByUserId(
        userId.value,
        userDate.value,
      );
      Get.back();
      Get.snackbar(
        'Upload Successful',
        'Foto berhasil ditambahkan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
      update();
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
