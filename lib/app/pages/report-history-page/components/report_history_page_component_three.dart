import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ReportHistoryPageComponentThree extends StatelessWidget {
  const ReportHistoryPageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: height * 0.025,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Pilih tanggal untuk melihat laporan harian:',
            style: tsBodySmallSemibold(blackColor),
            group: AutoSizeGroup(),
            maxLines: 1,
          ),
          SizedBox(height: height * 0.005),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 6,
                backgroundColor: primaryColor,
              ),
              SizedBox(width: width * 0.02),
              AutoSizeText(
                group: AutoSizeGroup(),
                maxLines: 1,
                'Laporan Harian',
                style: tsBodySmallRegular(blackColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
