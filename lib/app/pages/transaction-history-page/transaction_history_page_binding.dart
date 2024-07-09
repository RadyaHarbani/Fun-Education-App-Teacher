import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_controller.dart';
import 'package:get/get.dart';

class TransactionHistoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionHistoryPageController>(() => TransactionHistoryPageController());
  }
}