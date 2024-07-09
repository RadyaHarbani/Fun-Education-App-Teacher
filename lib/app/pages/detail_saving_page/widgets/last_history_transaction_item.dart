// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class LastHistoryTransactionItem extends StatelessWidget {
  const LastHistoryTransactionItem({
    Key? key,
    required this.transactionType,
    required this.transactionAmount,
  }) : super(key: key);

  final String transactionType;
  final String transactionAmount;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color:
            transactionType == 'Pemasukan Terakhir' ? whiteColor : primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.035,
              vertical: height * 0.012,
            ),
            decoration: BoxDecoration(
              color: transactionType == 'Pemasukan Terakhir'
                  ? warningColor
                  : whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              transactionType == 'Pemasukan Terakhir'
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_upward_rounded,
              size: 20,
              color: transactionType == 'Pemasukan Terakhir'
                  ? whiteColor
                  : primaryColor,
            ),
          ),
          SizedBox(height: height * 0.005),
          Container(
            width: width * 0.25,
            child: AutoSizeText(
              group: AutoSizeGroup(),
              maxLines: 2,
              '$transactionType',
              style: tsBodySmallRegular(
                transactionType == 'Pemasukan Terakhir'
                    ? blackColor
                    : whiteColor,
              ),
            ),
          ),
          SizedBox(height: height * 0.015),
          AutoSizeText(
            group: AutoSizeGroup(),
            maxLines: 1,
            'Rp. $transactionAmount',
            style: tsBodyLargeSemibold(
              transactionType == 'Pemasukan Terakhir' ? blackColor : whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
