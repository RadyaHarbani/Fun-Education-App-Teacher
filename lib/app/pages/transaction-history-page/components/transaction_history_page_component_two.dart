import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/widgets/history_transaction_item.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/components/bottomsheet_select_month_transaction.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/widgets/total_transaction_history_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionHistoryPageComponentTwo extends GetView<TransactionHistoryPageController> {
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
        AutoSizeText(
          '${controller.selectedMonth.value} 2024',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyMediumRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        Row(
          children: [
            Expanded(
              child: TotalTransactionHistoryItem(
                transactionType: 'Total Pemasukan',
                transactionAmount: '100.000',
              ),
            ),
            SizedBox(width: width * 0.02),
            Expanded(
              child: TotalTransactionHistoryItem(
                transactionType: 'Total Pengeluaran',
                transactionAmount: '100.000',
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return HistoryTransactionItem(
              transactionType: 'Pemasukan',
              transactionAmount: '100.000',
              transactionDate:
                  '${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
              transactionDescription: 'Tidak Ada Deskripsi',
            );
          },
        ),
      ],
    );
  }
}
