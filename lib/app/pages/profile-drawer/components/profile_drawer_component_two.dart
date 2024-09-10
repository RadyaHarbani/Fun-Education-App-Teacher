import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileDrawerComponentTwo extends StatelessWidget {
  const ProfileDrawerComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Kelulusan',
          style: tsBodyMediumRegular(blackColor),
          maxLines: 1,
        ),
        SizedBox(height: height * 0.015),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.GRADUATED_STUDENT_PAGE);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.list_rounded,
                    color: blackColor,
                  ),
                  SizedBox(width: width * 0.03),
                  AutoSizeText(
                    'Daftar Kelulusan',
                    style: tsBodySmallSemibold(blackColor),
                    maxLines: 1,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: blackColor,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.018),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.MANAGEMENT_INCOMING_SHIFT_PAGE);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time_filled_rounded,
                    color: blackColor,
                  ),
                  SizedBox(width: width * 0.03),
                  AutoSizeText(
                    'Shift Masuk',
                    style: tsBodySmallSemibold(blackColor),
                    maxLines: 1,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: blackColor,
                size: 15,
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.018),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.MANAGEMENT_SCHOOL_INFORMATION_PAGE);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.info_rounded,
                    color: blackColor,
                  ),
                  SizedBox(width: width * 0.03),
                  AutoSizeText(
                    'Informasi Sekolah',
                    style: tsBodySmallSemibold(blackColor),
                    maxLines: 1,
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: blackColor,
                size: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
