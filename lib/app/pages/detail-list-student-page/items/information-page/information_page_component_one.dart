import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class InformationPageComponentOne extends StatelessWidget {
  const InformationPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          TextSpan(
            children: [
              TextSpan(
                text: 'Ananda,\n',
                style: tsBodySmallRegular(blackColor),
              ),
              TextSpan(
                text: 'Muhammad Fadil',
                style: tsBodyMediumSemibold(blackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.025,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: whiteColor,
          ),
          child: AutoSizeText.rich(
            group: AutoSizeGroup(),
            maxLines: 2,
            TextSpan(
              children: [
                TextSpan(
                  text: 'Tempat, Tanggal Lahir\n',
                  style: tsBodySmallRegular(greyColor).copyWith(
                    height: 2.0,
                  ),
                ),
                TextSpan(
                  text: 'Batam, 17 November 2006',
                  style: tsBodySmallSemibold(blackColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.025,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: whiteColor,
          ),
          child: AutoSizeText.rich(
            group: AutoSizeGroup(),
            TextSpan(
              children: [
                TextSpan(
                  text: 'Alamat Lengkap\n',
                  style: tsBodySmallRegular(greyColor).copyWith(
                    height: 2.0,
                  ),
                ),
                TextSpan(
                  text: 'Griya batu aji asri g1 no 06 semarang kota batang',
                  style: tsBodySmallSemibold(blackColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        CommonButton(
          text: 'Edit Informasi',
          backgroundColor: primaryColor,
          textColor: whiteColor,
          icon: Icons.edit_rounded,
        ),
      ],
    );
  }
}
