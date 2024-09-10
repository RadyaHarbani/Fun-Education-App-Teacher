import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
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
      height: height * 0.82,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.03,
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: width * 0.15,
                height: height * 0.008,
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4),
                ),
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
                    text: 'Pilih Bulan dan Tahun\n',
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
            SizedBox(height: height * 0.02),
            CommonWarning(
              backColor: warningColor,
              text:
                  'Tidak ada transaksi pada bulan yang ditandai dengan warna abu-abu',
            ),
            SizedBox(height: height * 0.02),
            Expanded(
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Pilih Tahun',
                        style: tsBodyMediumRegular(blackColor),
                        maxLines: 1,
                      ),
                      SizedBox(height: height * 0.01),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: controller.showAvailableYearResponse?.data
                                .map((year) {
                              return ChoiceChip(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                label: Text(
                                  year.toString(),
                                  style: tsBodySmallSemibold(
                                    controller.selectedYear.value ==
                                            year.toString()
                                        ? whiteColor
                                        : blackColor,
                                  ),
                                ),
                                side: BorderSide.none,
                                labelPadding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.005,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03,
                                  vertical: height * 0.008,
                                ),
                                showCheckmark: false,
                                selectedColor: greenColor,
                                checkmarkColor: whiteColor,
                                selected: controller.selectedYear.value ==
                                    year.toString(),
                                onSelected: (selected) {
                                  if (selected) {
                                    controller.selectedYear.value =
                                        year.toString();
                                  }
                                },
                                backgroundColor: greyColor.withOpacity(0.1),
                              );
                            }).toList() ??
                            [],
                      ),
                      SizedBox(height: height * 0.025),
                      AutoSizeText(
                        'Pilih Bulan',
                        style: tsBodyMediumRegular(blackColor),
                        maxLines: 1,
                      ),
                      SizedBox(height: height * 0.01),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 6.0,
                        children: controller.allMonths.map((month) {
                          bool isAvailable = controller
                                  .showAvailableMonthResponse?.data
                                  .contains(month) ??
                              false;
                          bool isSelected =
                              controller.selectedMonth.value == month;
                          return ChoiceChip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            label: Text(
                              month,
                              style: tsBodySmallSemibold(
                                isSelected && !isAvailable
                                    ? blackColor
                                    : (isSelected ? whiteColor : blackColor),
                              ),
                            ),
                            side: BorderSide.none,
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.06,
                              vertical: height * 0.0055,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.008,
                            ),
                            showCheckmark: false,
                            selectedColor: isAvailable
                                ? greenColor
                                : greyColor.withOpacity(0.1),
                            backgroundColor: isAvailable
                                ? (isSelected
                                    ? greenColor
                                    : greenColor.withOpacity(0.2))
                                : greyColor.withOpacity(0.1),
                            selected: isSelected,
                            onSelected: (selected) {
                              if (isAvailable && selected) {
                                controller.selectedMonth.value = month;
                              }
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: height * 0.03),
            Obx(() => CommonButton(
                  isLoading: controller.isLoadingShowHistoryTransaction.value,
                  text: 'Lihat Riwayat',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () async {
                    await controller.showTransactionByUserIdAndMonthAndYear();
                    Get.back();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
