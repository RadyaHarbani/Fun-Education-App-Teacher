import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/components/transaction_history_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/components/transaction_history_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class TransactionHistoryPageView
    extends GetView<TransactionHistoryPageController> {
  const TransactionHistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Riwayat Transaksi',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TransactionHistoryPageComponentOne(),
              SizedBox(height: height * 0.02),
              TransactionHistoryPageComponentTwo(),
            ],
          ),
        ),
      ),
    );
  }
}
