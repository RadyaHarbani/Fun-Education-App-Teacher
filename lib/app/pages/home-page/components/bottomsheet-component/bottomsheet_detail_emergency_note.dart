import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetDetailEmergencyNote extends GetView<HomePageController> {
  const BottomsheetDetailEmergencyNote({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.6,
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
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  width: width * 0.013,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: dangerColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Informasi Penting\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Khusus Keadaan Mendesak',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  width: width,
                  margin: EdgeInsets.symmetric(vertical: height * 0.03),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AutoSizeText(
                    '${controller.showLatestEmergencyNoteModel.value.catatan}',
                    maxLines: 10,
                    style: tsBodySmallMedium(blackColor),
                  )),
            ),
            CommonButton(
              text: 'Tutup',
              backgroundColor: blackColor,
              textColor: whiteColor,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
