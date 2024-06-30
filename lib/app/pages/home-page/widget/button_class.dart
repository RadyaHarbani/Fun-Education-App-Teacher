// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ButtonClass extends StatelessWidget {
  const ButtonClass({
    Key? key,
    required this.shiftTime,
    required this.onTap,
  }) : super(key: key);

  final String shiftTime;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.12,
        decoration: BoxDecoration(
          color: greyColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'Shift Masuk',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodySmallRegular(blackColor),
            ),
            AutoSizeText(
              '$shiftTime',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
