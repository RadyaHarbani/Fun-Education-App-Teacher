import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailReportPageComponentPermission
    extends GetView<DetailReportPageController> {
  final String permission;
  const DetailReportPageComponentPermission({
    super.key,
    required this.permission,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 1,
              TextSpan(
                text: '${DateFormat('EEEE,').format(controller.userDate)} ',
                style: tsBodyLargeSemibold(blackColor),
                children: [
                  TextSpan(
                    text:
                        '${DateFormat('dd MMMM yyyy').format(controller.userDate)}',
                    style: tsBodyLargeRegular(blackColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                vertical: height * 0.025,
                horizontal: width * 0.05,
              ),
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: AutoSizeText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ananda,\n',
                      style: tsBodySmallRegular(primaryColor),
                    ),
                    TextSpan(
                      text: '${controller.userFullName}',
                      style: tsBodySmallSemibold(whiteColor),
                    ),
                  ],
                ),
                group: AutoSizeGroup(),
                maxLines: 2,
              ),
            ),
            SizedBox(height: height * 0.12),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/empty_list.svg'),
                  SizedBox(height: height * 0.01),
                  AutoSizeText.rich(
                    TextSpan(
                      text: 'Tidak Ada Laporan\n',
                      style: tsBodyMediumSemibold(blackColor),
                      children: [
                        TextSpan(
                          text: 'Ananda $permission di Tanggal Tersebut',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    group: AutoSizeGroup(),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.2),
            AutoSizeText(
              group: AutoSizeGroup(),
              maxLines: 1,
              'Catatan Guru :',
              style: tsBodyMediumSemibold(blackColor),
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.025,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: greyColor.withOpacity(0.05),
              ),
              child: Obx(() => AutoSizeText(
                    group: AutoSizeGroup(),
                    controller.userNote.value.isEmpty
                        ? 'Tidak ada catatan'
                        : '${controller.userNote.value}',
                    style: tsBodySmallRegular(blackColor),
                  )),
            ),
            SizedBox(height: height * 0.02),
            CommonButton(
              text: 'Edit Laporan',
              backgroundColor: greyColor.withOpacity(0.1),
              textColor: blackColor,
              onPressed: () {
                Get.toNamed(
                  Routes.EDIT_REPORT_PAGE,
                  arguments: {
                    'userId': controller.userId.value,
                    'userFullName': controller.userFullName.value,
                    'userGrade': controller.showGradeModel,
                    'userNote': controller.userNote.value,
                    'userDate': controller.userDate,
                    'userPermission': controller.userPermission.value,
                    'userShift': controller.incomingShift.value,
                  },
                );
              },
            ),
            SizedBox(height: height * 0.01),
            Obx(() => CommonButton(
                  text: 'Hapus Laporan',
                  isLoading: controller.isLoadingDeleteDailyReport.value,
                  backgroundColor: dangerColor,
                  textColor: whiteColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CommonAlertDialog(
                          title: 'Konfirmasi',
                          content: 'Apakah anda yakin untuk mengahapus laporan',
                          cancelButtonText: 'Tidak',
                          confirmButtonText: 'Iya',
                          onConfirm: () {
                            Get.back();
                            controller.deleteDailyReportByAdmin();
                          },
                        );
                      },
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
