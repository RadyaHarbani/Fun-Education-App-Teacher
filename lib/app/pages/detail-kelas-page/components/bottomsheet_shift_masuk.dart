import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/widgets/custom_radio_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-kelas-page/detail_kelas_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetShiftMasuk extends GetView<DetailKelasPageController> {
  const BottomsheetShiftMasuk({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.7,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: height * 0.01),
              width: width * 0.15,
              height: height * 0.008,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  width: width * 0.016,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: warningColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Jam Belajar Siswa\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Shift Masuk',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Obx(() => Column(
                  children: [
                    CustomRadioButton(
                      title: 'Jam 08.00 - 10.00',
                      value: '08.00 - 10.00',
                      color: greyColor,
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) => controller.selectTime(value),
                    ),
                    CustomRadioButton(
                      title: 'Jam 10.00 - 11.30',
                      value: '10.00 - 11.30',
                      color: greyColor,
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) => controller.selectTime(value),
                    ),
                    CustomRadioButton(
                      title: 'Jam 11.30 – 13.00',
                      value: '11.30 – 13.00',
                      color: greyColor,
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) => controller.selectTime(value),
                    ),
                    CustomRadioButton(
                      title: 'Jam 13.00 – 14.00',
                      value: '13.00 – 14.00',
                      color: greyColor,
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) => controller.selectTime(value),
                    ),
                    CustomRadioButton(
                      title: 'Jam 14.00 – 15.00',
                      value: '14.00 – 15.00',
                      color: greyColor,
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) => controller.selectTime(value),
                    ),
                  ],
                )),
            SizedBox(height: height * 0.032),
            CommonButton(
              text: 'Simpan Perubahan',
              onPressed: () => Navigator.pop(context),
              color: blackColor,
            )
          ],
        ),
      ),
    );
  }
}
