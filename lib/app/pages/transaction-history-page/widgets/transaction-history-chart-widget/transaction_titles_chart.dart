import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class TransactionTitleChart {
  Widget mingguanTitles(double value, TitleMeta meta) {
    final List<String> weekdays = ['S', 'S', 'R', 'K', 'J', 'S', 'M'];

    if (value >= 0 && value < weekdays.length) {
      return AutoSizeText(
        weekdays[value.toInt()],
        style: tsBodyMediumSemibold(blackColor),
      );
    } else {
      return SizedBox.shrink(); 
    }
  }

  Widget bulananTitles(double value, TitleMeta meta) {
    final style = tsBodyMediumSemibold(blackColor);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      // space: 16,
      child: AutoSizeText.rich(
        TextSpan(
          text: 'Minggu\n',
          style: style.copyWith(height: 1.3),
          children: [
            TextSpan(
              text: '${value.toInt() + 1}',
              style: style,
            ),
          ],
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}