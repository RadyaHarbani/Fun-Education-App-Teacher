import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class BottomsheetDetailPhoto extends StatelessWidget {
  const BottomsheetDetailPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.65,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.03,
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.15,
              height: height * 0.008,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.27,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.pravatar.cc/50?u=1',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        color: blackColor,
                        size: 20,
                      ),
                      SizedBox(width: width * 0.02),
                      AutoSizeText(
                        'Rabu, 12 Agustus 2021',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Outbound - Salatiga',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodyMediumSemibold(blackColor),
                      ),
                      SizedBox(height: height * 0.01),
                      AutoSizeText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, eleifend nunc. Donec nec nunc nec nunc.',
                        group: AutoSizeGroup(),
                        maxLines: 3,
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            CommonButton(
              text: 'Download Gambar',
              backgroundColor: blackColor,
              textColor: whiteColor,
              icon: Icons.file_download_rounded,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
