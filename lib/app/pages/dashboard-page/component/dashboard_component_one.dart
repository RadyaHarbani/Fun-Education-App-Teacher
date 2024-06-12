import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DashboardComponentOne extends StatelessWidget {
  final VoidCallback openDrawer;

  const DashboardComponentOne({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText.rich(
          textAlign: TextAlign.start,
          TextSpan(
            text: 'Senin, 25 November 2024\n',
            style: tsBodySmallRegular(greyColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: 'Halo, Tuti Caidah',
                style: tsTitleSmallSemibold(blackColor),
              ),
            ],
          ),
          maxLines: 2,
        ),
        GestureDetector(
          onTap: openDrawer,
          child: Container(
            height: height * 0.06,
            width: width * 0.135,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
