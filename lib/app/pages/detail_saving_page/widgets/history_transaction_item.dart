// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class HistoryTransactionItem extends StatelessWidget {
  const HistoryTransactionItem({
    Key? key,
    required this.transactionType,
    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionDescription,
  }) : super(key: key);

  final String transactionType;
  final String transactionAmount;
  final String transactionDate;
  final String transactionDescription;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.05,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: width * 0.03,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.013,
                      horizontal: width * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: transactionType == 'Pemasukan'
                          ? warningColor
                          : dangerColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      transactionType == 'Pemasukan'
                          ? Icons.arrow_downward_rounded
                          : Icons.arrow_upward_rounded,
                      color: whiteColor,
                      size: 20,
                    ),
                  ),
                  AutoSizeText.rich(
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: '$transactionType\n',
                      style: tsBodySmallSemibold(blackColor),
                      children: [
                        TextSpan(
                          text: '$transactionDate',
                          style: tsBodySmallRegular(
                            blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              transactionType == 'Pemasukan'
                  ? AutoSizeText(
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      '+Rp.$transactionAmount',
                      style: tsBodySmallSemibold(
                        successColor,
                      ),
                    )
                  : AutoSizeText(
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      '-Rp.$transactionAmount',
                      style: tsBodySmallSemibold(
                        dangerColor,
                      ),
                    ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            width: width,
            padding: EdgeInsets.symmetric(
              vertical: height * 0.015,
              horizontal: width * 0.05,
            ),
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 2,
              textAlign: TextAlign.start,
              TextSpan(
                text: 'Keterangan :\n',
                style: tsBodySmallSemibold(blackColor),
                children: [
                  TextSpan(
                    text: '$transactionDescription',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
