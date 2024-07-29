import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetAddIncomingNote extends GetView<DetailSavingPageController> {
  const BottomsheetAddIncomingNote({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.55 + MediaQuery.of(context).viewInsets.bottom,
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
                    color: warningColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Catat Pemasukan\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Tabungan Siswa',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        'Jumlah Nominal',
                        style: tsBodySmallSemibold(blackColor),
                      ),
                      SizedBox(height: height * 0.01),
                      CommonTextField(
                        obscureText: false,
                        hintText: 'Masukkan Nominal',
                        keyboardType: TextInputType.number,
                        fieldController: controller.amountIncomingController,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText.rich(
                        group: AutoSizeGroup(),
                        maxLines: 2,
                        TextSpan(
                          text: 'Keterangan\n',
                          style: tsBodySmallSemibold(blackColor),
                          children: [
                            TextSpan(
                                text: '*opsional',
                                style: tsBodySmallRegular(dangerColor).copyWith(
                                  height: 1.3,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      CommonTextField(
                        obscureText: false,
                        hintText: 'Tambahkan Keterangan',
                        keyboardType: TextInputType.text,
                        fieldController: controller.descriptionIncomingController,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            CommonButton(
              text: 'Catat Pemasukan',
              backgroundColor: blackColor,
              textColor: whiteColor,
              onPressed: () {
                controller.storeTransactionByAdmin('income');
              },
            ),
          ],
        ),
      ),
    );
  }
}
