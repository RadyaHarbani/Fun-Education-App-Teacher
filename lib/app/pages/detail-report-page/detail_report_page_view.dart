import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/widgets/report_list_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/widgets/total_point_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailReportPageView extends GetView<DetailReportPageController> {
  const DetailReportPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Detail Laporan',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText.rich(
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    TextSpan(
                      text: '${DateFormat('EEEE,').format(DateTime.now())} ',
                      style: tsBodyLargeSemibold(blackColor),
                      children: [
                        TextSpan(
                          text:
                              '${DateFormat('dd MMMM yyyy').format(DateTime.now())}',
                          style: tsBodyLargeRegular(blackColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  TotalPointItem(totalPoint: 40),
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
                            text: 'Radya Hukma Shabiyyaa Harbani',
                            style: tsBodySmallSemibold(whiteColor),
                          ),
                        ],
                      ),
                      group: AutoSizeGroup(),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.035, vertical: height * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor.withOpacity(0.05),
                    ),
                    child: Column(
                      children: [
                        ReportListItem(
                          no: 1,
                          text: 'Datang tepat pada waktunya',
                          point: 'A',
                        ),
                        ReportListItem(
                          no: 2,
                          text: 'Berpakaian rapi',
                          // point: 'B',
                          point: 'C',
                        ),
                        ReportListItem(
                          no: 3,
                          text: 'Berbuat baik dengan teman',
                          point: 'A',
                        ),
                        ReportListItem(
                          no: 4,
                          text: 'Mau menolong dan berbagi dengan teman',
                          point: 'A',
                        ),
                        ReportListItem(
                          no: 5,
                          text: 'Merapikan alat belajar dan mainan sendiri',
                          point: 'C',
                        ),
                        ReportListItem(
                          no: 6,
                          text: 'Menyelesaikan tugas',
                          point: 'A',
                        ),
                        ReportListItem(
                          no: 7,
                          text: 'Membaca',
                          point: 'A',
                        ),
                        ReportListItem(
                          no: 8,
                          text: 'Menulis',
                          point: 'C',
                        ),
                        ReportListItem(
                          no: 9,
                          text: 'Dikte',
                          point: 'B',
                        ),
                        ReportListItem(
                          no: 10,
                          text: 'Keterampilan',
                          point: 'A',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    'Catatan Guru :',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                      vertical: height * 0.025,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyColor.withOpacity(0.05),
                    ),
                    child: AutoSizeText(
                      group: AutoSizeGroup(),
                      'Ananda, Radya Hukma Shabiyyaa Harbani adalah anak yang cerdas dan rajin. Ananda selalu berusaha untuk menyelesaikan tugasnya dengan baik. Ananda juga selalu membantu teman-temannya yang kesulitan. Ananda adalah anak yang baik dan patuh.',
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              CommonButton(
                text: 'Edit Laporan',
                backgroundColor: greyColor.withOpacity(0.1),
                textColor: blackColor,
                onPressed: () {},
              ),
              SizedBox(height: height * 0.01),
              CommonButton(
                text: 'Hapus Laporan',
                backgroundColor: dangerColor,
                textColor: whiteColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
