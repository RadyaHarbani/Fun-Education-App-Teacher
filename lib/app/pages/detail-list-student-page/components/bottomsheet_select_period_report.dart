import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/custom_radio_button_period.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetSelectPeriodReport
    extends GetView<DetailListStudentPageController> {
  const BottomsheetSelectPeriodReport({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      // height: height * 0.5,
      height: height * 0.38,
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
                    text: 'Pilih Periode\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Pilih Untuk Melihat Perkembangan Point',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Expanded(
              child: Obx(
                () => Column(
                  children: [
                    // CustomRadioButtonPeriod(
                    //   title: '5 Laporan Terakhir',
                    //   value: '5',
                    //   groupValue: controller.selectedReportPoint.value,
                    //   onChanged: (value) =>
                    //       controller.selectedReportPoint(value),
                    // ),
                    // SizedBox(height: height * 0.01),
                    // CustomRadioButtonPeriod(
                    //   title: '10 Laporan Terakhir',
                    //   value: '10',
                    //   groupValue: controller.selectedReportPoint.value,
                    //   onChanged: (value) =>
                    //       controller.selectedReportPoint(value),
                    // ),
                    // SizedBox(height: height * 0.01),
                    // CustomRadioButtonPeriod(
                    //   title: '20 Laporan Terakhir',
                    //   value: '20',
                    //   groupValue: controller.selectedReportPoint.value,
                    //   onChanged: (value) =>
                    //       controller.selectedReportPoint(value),
                    // ),
                    // SizedBox(height: height * 0.01),
                    // CustomRadioButtonPeriod(
                    //   title: '30 Laporan Terakhir',
                    //   value: '30',
                    //   groupValue: controller.selectedReportPoint.value,
                    //   onChanged: (value) =>
                    //       controller.selectedReportPoint(value),
                    // ),
                    CustomRadioButtonPeriod(
                      title: 'Mingguan (Terakhir)',
                      value: 'weekly',
                      groupValue: controller.selectedReportPoint.value,
                      onChanged: (value) =>
                          controller.selectedReportPoint(value),
                    ),
                    SizedBox(height: height * 0.01),
                    CustomRadioButtonPeriod(
                      title: 'Bulanan (Terakhir)',
                      value: 'monthly',
                      groupValue: controller.selectedReportPoint.value,
                      onChanged: (value) =>
                          controller.selectedReportPoint(value),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Obx(() => CommonButton(
                  isLoading: controller.isLoadingShowStatisticDailyReport.value,
                  text: 'Tutup',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () async {
                    await controller.showStatisticDailyReportByUserId();
                    Get.back();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
