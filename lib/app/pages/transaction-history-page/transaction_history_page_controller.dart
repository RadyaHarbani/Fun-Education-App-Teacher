import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/widgets/transaction-history-chart-widget/transaction_value_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class TransactionHistoryPageController extends GetxController {
  var selectedPeriod = 'Mingguan'.obs;
  var selectedMonth = 'Januari'.obs;

  final List<BarChartGroupData> mingguanData = [
    TransactionValueChart.makeGroupDataTransaction(0, 200000, 500000),
    TransactionValueChart.makeGroupDataTransaction(1, 100000, 1000000),
    TransactionValueChart.makeGroupDataTransaction(2, 150000, 500000),
    TransactionValueChart.makeGroupDataTransaction(3, 30000, 1000000),
    TransactionValueChart.makeGroupDataTransaction(4, 230000, 500000),
    TransactionValueChart.makeGroupDataTransaction(5, 1000000, 500000),
    TransactionValueChart.makeGroupDataTransaction(6, 310000, 500000),
  ];

  final List<BarChartGroupData> bulananData = [
    TransactionValueChart.makeGroupDataTransaction(0, 200, 500),
    TransactionValueChart.makeGroupDataTransaction(1, 100, 1000),
    TransactionValueChart.makeGroupDataTransaction(2, 150, 500),
    TransactionValueChart.makeGroupDataTransaction(3, 30, 1000),
  ];

  String getWeekDay(int value) {
    switch (value) {
      case 0:
        return 'Senin';
      case 1:
        return 'Selasa';
      case 2:
        return 'Rabu';
      case 3:
        return 'Kamis';
      case 4:
        return 'Jumat';
      case 5:
        return 'Sabtu';
      case 6:
        return 'Minggu';
      default:
        throw Error();
    }
  }

  String getWeekNumber(int value) {
    return 'Minggu ${value + 1}';
  }

  AutoSizeText transactionLimitValue(double value) {
    if (value == 0)
      return AutoSizeText(
        '0 rb',
        style: tsBodySmallRegular(blackColor),
      );
    if (value == 200000)
      return AutoSizeText(
        '200 rb',
        style: tsBodySmallRegular(blackColor),
      );
    if (value == 400000)
      return AutoSizeText(
        '400 rb',
        style: tsBodySmallRegular(blackColor),
      );
    if (value == 600000)
      return AutoSizeText(
        '600 rb',
        style: tsBodySmallRegular(blackColor),
      );
    if (value == 800000)
      return AutoSizeText(
        '800 rb',
        style: tsBodySmallRegular(blackColor),
      );
    if (value == 1000000)
      return AutoSizeText(
        '1 jt',
        style: tsBodySmallRegular(blackColor),
      );
    return AutoSizeText('');
  }
}
