import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:intl/intl.dart';

class DetailClassComponentThree extends StatelessWidget {
  const DetailClassComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 2,
              TextSpan(
                text: 'Laporan Hari Ini\n',
                style: tsBodyLargeSemibold(blackColor),
                children: [
                  TextSpan(
                    text:
                        '${DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now())}',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.012,
                  horizontal: width * 0.07,
                ),
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    AutoSizeText(
                      'Buat Laporan',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallMedium(whiteColor),
                    ),
                    SizedBox(width: width * 0.02),
                    Icon(
                      Icons.add_rounded,
                      color: whiteColor,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: ReportItem(
                    name: 'Syahran Fadhil',
                    image: 'https://i.pravatar.cc/50?u=$index',
                  ),
                );
              }),
        ),
      ],
    );
  }
}
