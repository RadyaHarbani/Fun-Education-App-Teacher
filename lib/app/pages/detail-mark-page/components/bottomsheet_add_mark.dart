import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetAddMark extends GetView<DetailMarkPageController> {
  const BottomsheetAddMark({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.35 + MediaQuery.of(context).viewInsets.bottom,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.02,
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
                    text: 'Beri Nilai\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Beri Nilai Untuk Tugas Ananda',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: CommonTextField(
                fieldController: controller.markController,
                keyboardType: TextInputType.number,
                obscureText: false,
                hintText: '100',
              ),
            ),
            Obx(() => CommonButton(
                  isLoading: controller.isLoadingUpdateGrade.value,
                  text: 'Kirim Nilai',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    controller.sendGradeByAdmin(
                        controller.showByUserIdDetail.value.id!);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
