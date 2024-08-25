// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:intl/intl.dart';

class ReportHistoryContainerItem extends StatelessWidget {
  final DateTime selectedDate;
  final int totalPoint;
  final String note;
  const ReportHistoryContainerItem({
    Key? key,
    required this.selectedDate,
    required this.totalPoint,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: totalPoint <= 40
            ? dangerColor.withOpacity(0.1)
            : totalPoint <= 70
                ? warningColor.withOpacity(0.1)
                : greenColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icFilledDocument.svg',
                      color: totalPoint <= 40
                          ? dangerColor
                          : totalPoint <= 70
                              ? warningColor
                              : greenColor,
                      height: height * 0.04,
                    ),
                    SizedBox(width: width * 0.025),
                    AutoSizeText.rich(
                      TextSpan(
                        text: 'Laporan Harian\n',
                        style: tsBodyMediumSemibold(blackColor).copyWith(
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(
                            text: '${DateFormat('EEEE, dd MMMM yyyy').format(selectedDate)}',
                            style: tsBodySmallRegular(blackColor),
                          ),
                        ],
                      ),
                      group: AutoSizeGroup(),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15,
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Container(
              decoration: BoxDecoration(
                color: whiteColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Total Point :',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallRegular(blackColor),
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: totalPoint <= 40
                                ? dangerColor
                                : totalPoint <= 70
                                    ? warningColor
                                    : greenColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.007,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/icPoint.svg',
                                  color: whiteColor,
                                  height: height * 0.02,
                                ),
                                SizedBox(width: width * 0.015),
                                AutoSizeText(
                                  '$totalPoint Point',
                                  group: AutoSizeGroup(),
                                  maxLines: 1,
                                  style: tsBodySmallSemibold(whiteColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        AutoSizeText(
                          totalPoint <= 40
                              ? 'Kurang Baik'
                              : totalPoint <= 70
                                  ? 'Baik'
                                  : 'Sangat Baik',
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          style: tsBodySmallSemibold(blackColor),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.015),
                    AutoSizeText(
                      'Catatan Guru :',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallRegular(blackColor),
                    ),
                    SizedBox(height: height * 0.01),
                    Container(
                      
                      padding: EdgeInsets.symmetric(vertical: height * 0.01),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: whiteColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: note.isNotEmpty
                                ? greenColor
                                : greyColor.withOpacity(0.5),
                          ),
                          SizedBox(width: width * 0.02),
                          AutoSizeText(
                            note.isNotEmpty ? '1 Catatan' : '0 Catatan',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallSemibold(blackColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
