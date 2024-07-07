// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class MarkStudentItem extends StatelessWidget {
  const MarkStudentItem({
    Key? key,
    required this.studentName,
    required this.date,
    required this.index,
    required this.mark,
  }) : super(key: key);

  final String studentName;
  final String date;
  final int index;
  final String mark;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.07,
            width: width * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: greyColor.withOpacity(0.2),
                width: 1.5,
              ),
            ),
            child: CircleAvatar(
              foregroundImage: NetworkImage(
                'https://i.pravatar.cc/50?u=$index',
              ),
            ),
          ),
          SizedBox(width: width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '$studentName',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallSemibold(blackColor).copyWith(height: 1.2),
              ),
              SizedBox(height: height * 0.01),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    color: blackColor,
                    size: 18,
                  ),
                  SizedBox(width: width * 0.01),
                  AutoSizeText(
                    '$date',
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          AutoSizeText(
            '$mark/100',
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodySmallMedium(blackColor),
          ),
        ],
      ),
    );
  }
}
