// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.015,
          horizontal: width * 0.04,
        ),
        child: Row(
          children: [
            Container(
              height: height * 0.06,
              width: width * 0.13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: greyColor.withOpacity(0.2),
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                  '$image',
                ),
              ),
            ),
            SizedBox(width: width * 0.03),
            AutoSizeText(
              '$name',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodySmallSemibold(blackColor),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: blackColor,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
