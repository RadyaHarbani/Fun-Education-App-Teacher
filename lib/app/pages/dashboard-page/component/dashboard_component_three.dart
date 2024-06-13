import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DashboardComponentThree extends StatelessWidget {
  const DashboardComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: width * 0.42,
          child: AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: 'Daftar Siswa\n',
              style: tsTitleSmallRegular(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Fun Education',
                  style: tsTitleSmallSemibold(secondaryColor),
                ),
              ],
            ),
            maxLines: 2,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.01,
            horizontal: width * 0.05,
          ),
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            children: [
              AutoSizeText(
                'Tambah Siswa',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallMedium(whiteColor),
              ),
              SizedBox(width: 9),
              Icon(
                Icons.add,
                size: 14,
                color: whiteColor,
              )
            ],
          ),
        ),
      ],
    );
  }
}
