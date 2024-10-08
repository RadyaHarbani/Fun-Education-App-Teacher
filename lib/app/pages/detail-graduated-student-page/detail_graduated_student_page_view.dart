import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-graduated-student-page/detail_graduated_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-graduated-student-page/widgets/graduated_information_container_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailGraduatedStudentPageView
    extends GetView<DetailGraduatedStudentPageController> {
  const DetailGraduatedStudentPageView({super.key});

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
          'Informasi Siswa',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.02,
        ),
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Ananda,\n',
                        style: tsBodySmallRegular(blackColor),
                      ),
                      TextSpan(
                        text:
                            '${controller.detailInformationUser.value.fullName}',
                        style: tsBodyMediumSemibold(blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.025),
                GraduatedInformationContainerItem(
                  titleInformation: 'Shift Masuk',
                  valueInformation:
                      '${controller.detailInformationUser.value.shift}',
                ),
                SizedBox(height: height * 0.01),
                GraduatedInformationContainerItem(
                  titleInformation: 'Nama Panggilan',
                  valueInformation:
                      '${controller.detailInformationUser.value.nickname}',
                ),
                SizedBox(height: height * 0.01),
                GraduatedInformationContainerItem(
                  titleInformation: 'Jenis Kelamin',
                  valueInformation:
                      '${controller.detailInformationUser.value.gender} ',
                ),
                SizedBox(height: height * 0.01),
                GraduatedInformationContainerItem(
                  titleInformation: 'Tempat, Tanggal Lahir',
                  valueInformation:
                      '${controller.detailInformationUser.value.birth}',
                ),
                SizedBox(height: height * 0.01),
                GraduatedInformationContainerItem(
                  titleInformation: 'Alamat Lengkap',
                  valueInformation:
                      '${controller.detailInformationUser.value.address}',
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_rounded,
                      color: blackColor,
                      size: 20,
                    ),
                    SizedBox(width: width * 0.02),
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      maxLines: 2,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Lulus Pada : ',
                            style: tsBodySmallRegular(blackColor),
                          ),
                          TextSpan(
                            text: controller.detailInformationUser.value
                                        .createdAt !=
                                    null
                                ? '${DateFormat('dd MMMM yyyy', 'id_ID').format(controller.detailInformationUser.value.createdAt!)}'
                                : 'Date not available',
                            style: tsBodySmallSemibold(blackColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
