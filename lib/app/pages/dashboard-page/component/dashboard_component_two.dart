import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DashboardComponentTwo extends StatelessWidget {
  const DashboardComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [shadowBlackBlur15Color5],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.01,
                  horizontal: width * 0.025,
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.access_time_filled,
                  color: whiteColor,
                  size: 25,
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/lets-icons_edit.svg',
                    color: blackColor,
                    width: 25,
                  ),
                  SizedBox(width: 10),
                  Icon(CupertinoIcons.trash, color: redColor, size: 23),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Text('Catatan Darurat', style: tsBodySmallRegular(blackColor)),
          SizedBox(height: 15),
          Text("Hari Ini Libur sampai 21 Juni 2024",
              style: tsBodyMediumSemibold(blackColor)),
          SizedBox(height: 24),
          Container(
            margin: EdgeInsets.only(top: height * 0.02),
            padding: EdgeInsets.symmetric(
              vertical: height * 0.018,
              horizontal: width * 0.06,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Lihat Detail',
                    style: tsLabelLargeMedium(whiteColor),
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: whiteColor,
                  size: 12,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
