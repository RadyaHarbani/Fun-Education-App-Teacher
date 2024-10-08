import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/widgets/history_transaction_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class DetailSavingPageComponentFour
    extends GetView<DetailSavingPageController> {
  const DetailSavingPageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/icHistory.svg'),
                SizedBox(width: width * 0.02),
                AutoSizeText(
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  'Riwayat Transaksi',
                  style: tsBodyMediumSemibold(blackColor),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.TRANSACTION_HISTORY_PAGE,
                  arguments: controller.userId.value,
                );
              },
              child: Row(
                children: [
                  AutoSizeText(
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    'Lihat Semua',
                    style: tsBodySmallRegular(blackColor),
                  ),
                  SizedBox(width: width * 0.01),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 15,
                    color: blackColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.03),
        Obx(() {
          if (controller.isLoadingDetailSaving.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: height * 0.01),
                    height: height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.transactionModel.length,
              itemBuilder: (context, index) {
                return HistoryTransactionItem(
                  transactionType:
                      '${controller.transactionModel[index].category == 'income' ? 'Pemasukan' : 'Pengeluaran'}',
                  transactionAmount:
                      '${controller.transactionModel[index].amount}',
                  transactionDate:
                      '${DateFormat('dd MMMM yyyy', 'id_ID').format(controller.transactionModel[index].date!)}',
                  transactionDescription:
                      '${controller.transactionModel[index].desc ?? 'Tidak Ada Deskripsi'}',
                );
              },
            );
          }
        }),
        SizedBox(height: height * 0.03),
      ],
    );
  }
}
