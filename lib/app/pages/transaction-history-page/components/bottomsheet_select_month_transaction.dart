import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/custom_radio_button_period.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetSelectMonthTransaction
    extends GetView<TransactionHistoryPageController> {
  const BottomsheetSelectMonthTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.85,
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
                    text: 'Pilih Bulan\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Pilih Untuk Melihat Riwayat Transaksi',
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
                    CustomRadioButtonPeriod(
                      title: 'Januari',
                      value: 'Januari',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Februari',
                      value: 'Februari',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Maret',
                      value: 'Maret',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'April',
                      value: 'April',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Mei',
                      value: 'Mei',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Juni',
                      value: 'Juni',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Juli',
                      value: 'Juli',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Agustus',
                      value: 'Agustus',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'September',
                      value: 'September',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Oktober',
                      value: 'Oktober',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'November',
                      value: 'November',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                    CustomRadioButtonPeriod(
                      title: 'Desember',
                      value: 'Desember',
                      groupValue: controller.selectedMonth.value,
                      onChanged: (value) => controller.selectedMonth(value),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            CommonButton(
              text: 'Tutup',
              backgroundColor: blackColor,
              textColor: whiteColor,
              onPressed: () async {
                await controller.showTransactionByUserIdAndMonth();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
