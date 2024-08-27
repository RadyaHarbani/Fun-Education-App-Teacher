import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/daily-report/service/daily_report_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditReportPageController extends GetxController {
  final DetailReportPageController detailReportPageController =
      Get.put(DetailReportPageController());
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
  DailyReportService dailyReportService = DailyReportService();
  TextEditingController teachersNote = TextEditingController();
  List<String> pointType = ['A', 'B', 'C'];
  List<RxString>? points = [];
  RxString userFullName = ''.obs;
  RxString userId = ''.obs;
  RxString userDate = ''.obs;
  RxString userPermission = ''.obs;
  RxString userShift = ''.obs;
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
  RxBool isLoadingEditReport = false.obs;

  @override
  void onInit() {
    super.onInit();
    userFullName.value = Get.arguments['userFullName'];
    teachersNote.text = Get.arguments['userNote'];
    userDate.value = DateFormat('yyyy-MM-dd').format(Get.arguments['userDate']);
    print(userDate.value);
    userId.value = Get.arguments['userId'];
    userPermission.value = Get.arguments['userPermission'];
    userShift.value = Get.arguments['userShift'];

    if (Get.arguments['userGrade'] != null &&
        Get.arguments['userGrade'].length >= 10) {
      points = List.generate(
          10, (index) => '${Get.arguments['userGrade'][index].grade}'.obs);
    } else {
      points = List.generate(10, (_) => 'A'.obs);
    }
  }

  Future updateDailyReportByAdmin() async {
    try {
      isLoadingEditReport(true);
      Map<String, String> activities = {
        for (int i = 0; i < points!.length; i++)
          'activity_${i + 1}': points![i].value,
      };
      await dailyReportService.putUpdateDailyReportByAdmin(
        userPermission.value == 'Hadir' ? true : false,
        teachersNote.text.isNotEmpty ? true : false,
        userDate.value,
        userId.value,
        activities,
        teachersNote.text,
        userPermission.value,
      );
      await detailReportPageController.showByUserId(
        userId.value,
        userDate.value,
      );

      await detailClassPageController.showUserDone(
        'true',
        userShift.value,
        DateTime.parse(userDate.value),
      );

      await detailClassPageController.showUserUndone(
        'false',
        userShift.value,
        DateTime.parse(userDate.value),
      );

      await ReportHistoryPageController()
          .showAvailableDateByUserId(userId.value);
      await ReportHistoryPageController().showByUserId(
        userId.value,
        userDate.value,
      );

      update();
      Get.back();
      isLoadingEditReport(false);
      Get.snackbar(
        'Edit Successful',
        'Laporan berhasil disimpan',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      isLoadingEditReport(false);
      print('Upload failed: $e');
      Get.snackbar(
        'Edit Failed',
        'Laporan gagal disimpan',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
