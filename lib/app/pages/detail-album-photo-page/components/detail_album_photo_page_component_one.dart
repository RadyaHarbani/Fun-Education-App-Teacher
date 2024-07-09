import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailAlbumPhotoPageComponentOne extends StatelessWidget {
  const DetailAlbumPhotoPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width * 0.12,
                height: height * 0.06,
                padding: EdgeInsets.symmetric(
                  horizontal: height * 0.01,
                  vertical: height * 0.01,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.photo_album_rounded,
                  color: blackColor,
                  size: 30,
                ),
              ),
              SizedBox(width: width * 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'Album',
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    style: tsBodySmallRegular(whiteColor),
                  ),
                  AutoSizeText(
                    'Outbound - Salatiga',
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    style: tsBodyMediumSemibold(whiteColor),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.015,
            ),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: width * 0.016,
                  height: height * 0.04,
                  decoration: BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(width: width * 0.03),
                AutoSizeText(
                  'Rekreasi ke tempat bermain di salatiga',
                  group: AutoSizeGroup(),
                  maxLines: 3,
                  style: tsBodySmallRegular(whiteColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
