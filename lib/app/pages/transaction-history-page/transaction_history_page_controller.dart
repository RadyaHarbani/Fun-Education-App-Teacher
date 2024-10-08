import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/models/show_available_month_response.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/models/show_available_year_response.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/models/transaction_model.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/models/transaction_response.dart';
import 'package:fun_education_app_teacher/app/api/savings/transaction/service/transaction_service.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/widgets/transaction-history-chart-widget/transaction_value_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TransactionHistoryPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  TransactionService transactionService = TransactionService();
  ShowAvailableMonthResponse? showAvailableMonthResponse;
  ShowAvailableYearResponse? showAvailableYearResponse;
  TransactionResponse? transactionResponse;
  RxList<TransactionModel> transactionModel = <TransactionModel>[].obs;
  var selectedPeriod = 'Mingguan'.obs;
  var selectedMonth =
      '${DateFormat('MMMM', 'id_ID').format(DateTime.now())}'.obs;
  var selectedYear =
      '${DateFormat('yyyy', 'id_ID').format(DateTime.now())}'.obs;
  RxString userId = ''.obs;
  RxString totalIncome = '0'.obs;
  RxString totalOutcome = '0'.obs;
  RxBool isLoadingShowHistoryTransaction = false.obs;

  final List<String> allMonths = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

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

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments;
    showTransactionByUserIdAndMonthAndYear();
    showAvailableMonthsByUserId();
    showAvailableYearsByUserId();
  }

  Future showAvailableMonthsByUserId() async {
    try {
      final response = await transactionService.getShowAvailableMonthsByUserId(
        userId.value,
        selectedYear.value,
      );
      showAvailableMonthResponse =
          ShowAvailableMonthResponse.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future showAvailableYearsByUserId() async {
    try {
      final response = await transactionService.getShowAvailableYearsByUserId(
        userId.value,
      );
      showAvailableYearResponse =
          ShowAvailableYearResponse.fromJson(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future showTransactionByUserIdAndMonthAndYear() async {
    try {
      isLoadingShowHistoryTransaction(true);
      final response =
          await transactionService.getShowTransactionByUserIdAndMonthAndYear(
        userId.value,
        selectedMonth.value,
        '2024',
      );
      transactionResponse = TransactionResponse.fromJson(response.data);
      transactionModel.value = transactionResponse!.data;
      if (transactionResponse != null) {
        totalIncome.value = transactionResponse!.totalIncome;
        totalOutcome.value = transactionResponse!.totalOutcome;
      }
      isLoadingShowHistoryTransaction(false);
    } catch (e) {
      isLoadingShowHistoryTransaction(false);
      print(e);
    }
  }
}
