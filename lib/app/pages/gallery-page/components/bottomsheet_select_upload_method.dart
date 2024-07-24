import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/widgets/upload_method_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class BottomSheetSelectUploadMethod extends StatelessWidget {
  const BottomSheetSelectUploadMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.52,
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
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Pilih Opsi\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Pilih Opsi yang Ada Dibawah',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.UPLOAD_PHOTO_PAGE);
                    },
                    child: UploadMethodItem(
                      title: 'Unggah Foto',
                      description: 'Tidak Pengelompokan, Minimal 1 Foto',
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.UPLOAD_ALBUM_PAGE);
                    },
                    child: UploadMethodItem(
                      title: 'Buat Album',
                      description: 'Pengelompokan, Minimal 5 Foto',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
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
