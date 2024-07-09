// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class TotalPointItem extends StatelessWidget {
  const TotalPointItem({
    Key? key,
    required this.totalPoint,
  }) : super(key: key);

  final int totalPoint;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: totalPoint <= 40
            ? dangerColor
            : totalPoint <= 70
                ? warningColor
                : successColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/icPoint.svg'),
              SizedBox(width: width * 0.01),
              AutoSizeText(
                '$totalPoint Poin',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallSemibold(whiteColor),
              ),
            ],
          ),
          AutoSizeText(
            totalPoint <= 40
                ? 'Kurang Baik'
                : totalPoint <= 70
                    ? 'Baik'
                    : 'Sangat Baik',
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodySmallRegular(whiteColor),
          ),
        ],
      ),
    );
  }
}
