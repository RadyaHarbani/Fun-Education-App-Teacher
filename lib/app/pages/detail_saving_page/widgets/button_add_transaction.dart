// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ButtonAddTransaction extends StatelessWidget {
  const ButtonAddTransaction({
    Key? key,
    required this.typeTransaction,
    required this.onTap,
  }) : super(key: key);

  final String typeTransaction;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.025,
        ),
        decoration: BoxDecoration(
          color:
              typeTransaction == 'Catat Pemasukan' ? whiteColor : primaryColor,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.035,
                vertical: height * 0.012,
              ),
              decoration: BoxDecoration(
                color: typeTransaction == 'Catat Pemasukan'
                    ? warningColor
                    : whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                typeTransaction == 'Catat Pemasukan'
                    ? Icons.arrow_downward_rounded
                    : Icons.arrow_upward_rounded,
                size: 20,
                color: typeTransaction == 'Catat Pemasukan'
                    ? whiteColor
                    : primaryColor,
              ),
            ),
            SizedBox(height: height * 0.01),
            Container(
              width: width * 0.3,
              child: AutoSizeText(
                group: AutoSizeGroup(),
                maxLines: 2,
                '$typeTransaction',
                style: tsBodySmallSemibold(typeTransaction == 'Catat Pemasukan'
                        ? blackColor
                        : whiteColor)
                    .copyWith(
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
