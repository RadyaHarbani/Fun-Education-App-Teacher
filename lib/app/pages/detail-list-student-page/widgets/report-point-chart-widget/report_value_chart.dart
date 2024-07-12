import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ReportValueChart {
  BarChartGroupData makeGroupDataReport(
    bool mingguan,
    int x,
    double y, {
    bool isTouched = false,
    double width = 16,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? blackColor : primaryColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: mingguan ? 200 : 2000,
            color: greyColor.withOpacity(0.1),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
