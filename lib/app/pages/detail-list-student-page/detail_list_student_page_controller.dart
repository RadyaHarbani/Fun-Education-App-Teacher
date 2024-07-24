import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_response.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/all-points-chart-widget/all_points_value_chart.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/report-point-chart-widget/report_value_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailListStudentPageController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabControllerAll;
  var selectedLearningFlow = 'A'.obs;
  var selectedReportPoint = 'Mingguan'.obs;
  var selectedAllPoints = 'Mingguan'.obs;
  var selectedDateTime = DateTime.now().obs;
  final Duration animDuration = const Duration(milliseconds: 250);
  RxInt touchedIndexReportChart = (-1).obs;
  final ReportValueChart reportValueChart = ReportValueChart();

  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  Rx<ShowCurrentUserModel> detailInformationUser = ShowCurrentUserModel().obs;


  List<BarChartGroupData> weeklyDataReport() => List.generate(
        7,
        (i) {
          switch (i) {
            case 0:
              return reportValueChart.makeGroupDataReport(true, 0, 100,
                  isTouched: i == touchedIndexReportChart.value);
            case 1:
              return reportValueChart.makeGroupDataReport(true, 1, 65,
                  isTouched: i == touchedIndexReportChart.value);
            case 2:
              return reportValueChart.makeGroupDataReport(true, 2, 50,
                  isTouched: i == touchedIndexReportChart.value);
            case 3:
              return reportValueChart.makeGroupDataReport(true, 3, 75,
                  isTouched: i == touchedIndexReportChart.value);
            case 4:
              return reportValueChart.makeGroupDataReport(true, 4, 90,
                  isTouched: i == touchedIndexReportChart.value);
            case 5:
              return reportValueChart.makeGroupDataReport(true, 5, 115,
                  isTouched: i == touchedIndexReportChart.value);
            case 6:
              return reportValueChart.makeGroupDataReport(true, 6, 65,
                  isTouched: i == touchedIndexReportChart.value);
            default:
              throw Error();
          }
        },
      );

  List<BarChartGroupData> monthlyDataReport() => List.generate(
        4,
        (i) {
          switch (i) {
            case 0:
              return reportValueChart.makeGroupDataReport(false, 0, 400,
                  isTouched: i == touchedIndexReportChart.value);
            case 1:
              return reportValueChart.makeGroupDataReport(false, 1, 700,
                  isTouched: i == touchedIndexReportChart.value);
            case 2:
              return reportValueChart.makeGroupDataReport(false, 2, 405,
                  isTouched: i == touchedIndexReportChart.value);
            case 3:
              return reportValueChart.makeGroupDataReport(false, 3, 120,
                  isTouched: i == touchedIndexReportChart.value);
            default:
              throw Error();
          }
        },
      );

  final List<BarChartGroupData> mingguanData = [
    AllPointsValueChart.makeGroupDataAllPoints(0, 700, 360),
    AllPointsValueChart.makeGroupDataAllPoints(1, 600, 740),
    AllPointsValueChart.makeGroupDataAllPoints(2, 200, 500),
    AllPointsValueChart.makeGroupDataAllPoints(3, 550, 1000),
    AllPointsValueChart.makeGroupDataAllPoints(4, 230, 500),
    AllPointsValueChart.makeGroupDataAllPoints(5, 1000, 500),
    AllPointsValueChart.makeGroupDataAllPoints(6, 310, 500),
  ];

  final List<BarChartGroupData> bulananData = [
    AllPointsValueChart.makeGroupDataAllPoints(0, 200, 500),
    AllPointsValueChart.makeGroupDataAllPoints(1, 400, 1000),
    AllPointsValueChart.makeGroupDataAllPoints(2, 750, 500),
    AllPointsValueChart.makeGroupDataAllPoints(3, 350, 1000),
  ];
  
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

  Future showByUserId (String userId) async {
    try {
      final response = await userService.getShowByUserId(userId);
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      detailInformationUser.value = showCurrentUserResponse!.data;
      print(detailInformationUser);
      update();
    } catch (e) {
      print(e);
    }

  }

  @override
  void onInit() {
    super.onInit();
    tabControllerAll = TabController(length: 2, vsync: this);
    showByUserId(Get.arguments);
  }

  @override
  void dispose() {
    super.dispose();
    tabControllerAll!.dispose();
  }
}
