// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class PointDescriptionItem extends StatelessWidget {
  const PointDescriptionItem({
    Key? key,
    required this.pointColor,
    required this.pointType,
    required this.pointDescription,
    required this.pointValue,
  }) : super(key: key);

  final Color pointColor;
  final String pointType;
  final String pointDescription;
  final String pointValue;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.07,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: pointColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: AutoSizeText(
            '$pointType',
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodyMediumSemibold(whiteColor),
          ),
        ),
        SizedBox(width: width * 0.03),
        AutoSizeText(
          ':   $pointDescription',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodySmallMedium(blackColor),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: pointColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: AutoSizeText(
            '$pointValue Poin',
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodySmallSemibold(whiteColor),
          ),
        ),
      ],
    );
  }
}
