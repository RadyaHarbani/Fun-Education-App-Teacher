import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageComponentOne extends StatelessWidget {
  const HomePageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          TextSpan(
            text: 'Daftar Siswa\n',
            style: tsTitleSmallRegular(blackColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: 'Fun Education',
                style: tsTitleSmallSemibold(blackColor),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.UNVERIFIED_STUDENT_PAGE);
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.012,
              horizontal: width * 0.06,
            ),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                AutoSizeText(
                  'Peninjauan Akun',
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  style: tsBodySmallMedium(whiteColor),
                ),
                SizedBox(width: width * 0.02),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: whiteColor,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
