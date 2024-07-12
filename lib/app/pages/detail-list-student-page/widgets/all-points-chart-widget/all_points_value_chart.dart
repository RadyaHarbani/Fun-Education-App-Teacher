import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class AllPointsValueChart {
  static BarChartGroupData makeGroupDataAllPoints(
    int x,
    double laporan,
    double tugas, {
    bool isTouched = false,
    double width = 78,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: laporan,
          color: primaryColor,
          width: 16,
        ),
        BarChartRodData(
          fromY: laporan + 0.9,
          toY: laporan + 0.2 + tugas,
          color: blackColor,
          width: 16,
        ),
      ],
    );
  }
}