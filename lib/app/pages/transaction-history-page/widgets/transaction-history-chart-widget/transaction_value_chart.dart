import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class TransactionValueChart{
  static BarChartGroupData makeGroupDataTransaction(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: dangerColor),
        BarChartRodData(toY: y2, color: successColor),
      ],
    );
  }
}