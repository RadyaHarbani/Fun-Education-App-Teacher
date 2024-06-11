import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DashboardComponentOne extends StatelessWidget {
  const DashboardComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Senin, 25 November 2024",
                style: tsBodySmallRegular(greyColor)),
            Text("Halo, Tuti Caudah", style: tsTitleSmallSemibold(blackColor)),
          ],
        ),
        Container(
          height: height * 0.06,
          width: width * 0.135,
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ],
    );
  }
}
