import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/widgets/last_history_transaction_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailSavingPageComponentOne extends StatelessWidget {
  const DetailSavingPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.04),
          AutoSizeText.rich(
            group: AutoSizeGroup(),
            maxLines: 2,
            textAlign: TextAlign.center,
            TextSpan(
              text: 'Rp. 100.000\n',
              style: tsHeadingLargeSemibold(whiteColor),
              children: [
                TextSpan(
                  text: 'Total Tabungan',
                  style: tsBodySmallRegular(whiteColor),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.025,
            ),
            child: Row(
              children: [
                Expanded(
                  child: LastHistoryTransactionItem(
                    transactionType: 'Pemasukan Terakhir',
                    transactionAmount: '100.000',
                  ),
                ),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: LastHistoryTransactionItem(
                    transactionType: 'Pengeluaran Terakhir',
                    transactionAmount: '50.000',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
