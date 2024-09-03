import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/widgets/history_transaction_item.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/components/bottomsheet_select_month_transaction.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/widgets/total_transaction_history_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class TransactionHistoryPageComponentTwo
    extends GetView<TransactionHistoryPageController> {
  const TransactionHistoryPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/icListTask.svg'),
                SizedBox(width: width * 0.02),
                AutoSizeText.rich(
                  TextSpan(
                    text: 'Riwayat Transaksi',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: whiteColor,
                  builder: (context) => BottomsheetSelectMonthTransaction(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.05,
                  ),
                  child: Row(
                    children: [
                      Obx(() => AutoSizeText(
                            controller.selectedMonth.value.toString(),
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallSemibold(blackColor),
                          )),
                      SizedBox(width: width * 0.01),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 25,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Obx(() => AutoSizeText(
              '${controller.selectedMonth.value} 2024',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodyMediumRegular(blackColor),
            )),
        SizedBox(height: height * 0.02),
        Obx(() {
          if (controller.isLoadingShowHistoryTransaction.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Row(
                children: [
                  Expanded(
                    child: TotalTransactionHistoryItem(
                      transactionType: 'Total Pemasukan',
                      transactionAmount: '0',
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                    child: TotalTransactionHistoryItem(
                      transactionType: 'Total Pengeluaran',
                      transactionAmount: '0',
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: TotalTransactionHistoryItem(
                    transactionType: 'Total Pemasukan',
                    transactionAmount: '${controller.totalIncome.value}',
                  ),
                ),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: TotalTransactionHistoryItem(
                    transactionType: 'Total Pengeluaran',
                    transactionAmount: '${controller.totalOutcome.value}',
                  ),
                ),
              ],
            );
          }
        }),
        SizedBox(height: height * 0.02),
        Obx(() {
          if (controller.isLoadingShowHistoryTransaction.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: height * 0.01),
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                },
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.transactionModel.length,
              itemBuilder: (context, index) {
                return HistoryTransactionItem(
                  transactionType:
                      '${controller.transactionModel[index].category == 'income' ? 'Pemasukan' : 'Pengeluaran'}',
                  transactionAmount:
                      '${controller.transactionModel[index].amount}',
                  transactionDate:
                      '${DateFormat('dd MMMM yyyy').format(controller.transactionModel[index].date!)}',
                  transactionDescription:
                      '${controller.transactionModel[index].desc ?? 'Tidak Ada Deskripsi'}',
                );
              },
            );
          }
        }),
      ],
    );
  }
}
