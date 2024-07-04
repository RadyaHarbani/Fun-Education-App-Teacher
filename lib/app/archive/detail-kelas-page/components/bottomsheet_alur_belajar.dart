import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/archive/detail-kelas-page/detail_kelas_page_controller.dart';
import 'package:fun_education_app_teacher/app/archive/detail-kelas-page/widgets/alur_belajar_option.dart';
import 'package:get/get.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class BottomsheetAlurBelajar extends GetView<DetailKelasPageController> {
  const BottomsheetAlurBelajar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
      height: height * 0.78,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      maxLines: 2,
                      TextSpan(
                        text: 'Alur Belajar Ananda\n',
                        style: tsBodyMediumSemibold(blackColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Apa saja yang akan dipelajari?',
                            style: tsBodySmallRegular(blackColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                AlurBelajarOption(
                  title: 'Mengenalkan Buku A',
                  subtitle1: 'Menebalkan Huruf',
                  subtitle2: 'Membaca Kartu Baju Sampai Cabe',
                  value: 'A',
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: AlurBelajarOption(
                    title: 'Mengenalkan Buku B',
                    subtitle1: 'Mencontoh Suku Kata',
                    subtitle2: 'Membaca Kartu Baju Sampai Cabe',
                    value: 'B',
                  ),
                ),
                AlurBelajarOption(
                  title: 'Mengenalkan Buku C',
                  subtitle1: 'Menyalin Kalimat',
                  subtitle2: 'Membaca Kartu Baju Sampai Cabe',
                  value: 'C',
                ),
              ],
            ),
            CommonButton(
                text: 'Tingkatkan',
                color: blackColor,
                onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }
}
