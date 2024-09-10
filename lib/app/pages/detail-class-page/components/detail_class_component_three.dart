import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/components/bottomsheet_select_student_report.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/report-page/list_hadir_permission.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/report-page/list_izin_permission.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/report-page/list_sakit_permission.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/report-page/list_undone_report.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class DetailClassComponentThree extends GetView<DetailClassPageController> {
  final AddReportPageController addReportPageController =
      AddReportPageController();

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    final DateTime today = DateTime.now();
    final DateTime onlyDateToday = DateTime(today.year, today.month, today.day);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Laporan Harian\n',
                    style: tsBodyLargeSemibold(blackColor),
                    children: [
                      TextSpan(
                        text:
                            '${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(controller.selectedDateTime.value)}',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                )),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.selectDateTime(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.013,
                      horizontal: width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.calendar_today_rounded,
                      color: greyColor,
                      size: 22,
                    ),
                  ),
                ),
                SizedBox(width: width * 0.01),
                InkWell(
                  onTap: () async {
                    // Get.toNamed(
                    //   Routes.ADD_REPORT_PAGE,
                    //   arguments: {
                    //     'incomingShift': controller
                    //         .showAllIncomingShiftModel.value.shiftMasuk,
                    //     'selectedDate': controller.selectedDateTime.value,
                    //   },
                    // );
                    await addReportPageController.showUserDoneUndone(
                      'false',
                      controller.showAllIncomingShiftModel.value.shiftMasuk!,
                      controller.selectedDateTime.value,
                    );
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: whiteColor,
                      builder: (context) => BottomsheetSelectStudentReport(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.013,
                      horizontal: width * 0.05,
                    ),
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        AutoSizeText(
                          'Buat',
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          style: tsBodySmallMedium(whiteColor),
                        ),
                        SizedBox(width: width * 0.02),
                        Icon(
                          Icons.add_rounded,
                          color: whiteColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        CommonWarning(
          backColor: warningColor,
          text:
              'Pilih tanggal jika ingin melihat dan membuat laporan dihari sebelumnya',
        ),
        SizedBox(height: height * 0.02),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Obx(() {
              if (controller.isLoadingDetailClass.value) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(10, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              } else {
                final selectedDate = controller.selectedDateTime.value;
                final DateTime onlyDateSelected = DateTime(
                    selectedDate.year, selectedDate.month, selectedDate.day);
                if (controller.showUserPermissionHadir.isEmpty &&
                    controller.showUserPermissionIzin.isEmpty &&
                    controller.showUserPermissionSakit.isEmpty &&
                    onlyDateSelected == onlyDateToday) {
                  return Column(
                    children: [
                      SizedBox(height: height * 0.1),
                      SvgPicture.asset('assets/images/empty_list.svg'),
                      SizedBox(height: height * 0.01),
                      AutoSizeText.rich(
                        TextSpan(
                          text: 'Tidak ada laporan hari ini\n',
                          style: tsBodyMediumSemibold(blackColor),
                          children: [
                            TextSpan(
                              text: 'Silahkan buat laporan hari ini',
                              style: tsBodySmallRegular(blackColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      onlyDateSelected != onlyDateToday &&
                              controller.showUserUndoneModel.isNotEmpty
                          ? ListUndoneReport()
                          : SizedBox.shrink(),
                      controller.showUserPermissionHadir.isNotEmpty
                          ? ListHadirPermission()
                          : SizedBox.shrink(),
                      controller.showUserPermissionIzin.isNotEmpty
                          ? ListIzinPermission()
                          : SizedBox.shrink(),
                      controller.showUserPermissionSakit.isNotEmpty
                          ? ListSakitPermission()
                          : SizedBox.shrink(),
                    ],
                  );
                }
              }
            }),
          ),
        ),
      ],
    );
  }
}
