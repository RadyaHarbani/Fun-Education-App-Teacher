// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class UploadMethodItem extends StatelessWidget {
  const UploadMethodItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.03,
      ),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: AutoSizeText.rich(
        textAlign: TextAlign.start,
        group: AutoSizeGroup(),
        maxLines: 2,
        TextSpan(
          text: '$title\n',
          style: tsBodyMediumSemibold(blackColor).copyWith(
            height: 1.5,
          ),
          children: [
            TextSpan(
              text: '$description',
              style: tsBodySmallRegular(blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
