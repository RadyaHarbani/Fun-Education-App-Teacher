import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-unverified-student-page/detail_unverified_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-unverified-student-page/widgets/information_container_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailUnverifiedStudentPageView
    extends GetView<DetailUnverifiedStudentPageController> {
  const DetailUnverifiedStudentPageView({super.key});

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
                InformationContainerItem(
                  titleInformation: 'Nama Panggilan',
                  valueInformation:
                      '${controller.detailInformationUser.value.nickname}',
                ),
                SizedBox(height: height * 0.01),
                InformationContainerItem(
                  titleInformation: 'Tempat, Tanggal Lahir',
                  valueInformation:
                      '${controller.detailInformationUser.value.birth}',
                ),
                SizedBox(height: height * 0.01),
                InformationContainerItem(
                  titleInformation: 'Alamat Lengkap',
                  valueInformation:
                      '${controller.detailInformationUser.value.address}',
                ),
                // SizedBox(height: height * 0.01),
                // InformationContainerItem(
                //   titleInformation: 'Kata Sandi',
                //   valueInformation:
                //       '${controller.informationPasswordUser.value.password}',
                // ),
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
                            text: 'Mendaftar Pada : ',
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
                Spacer(),
                Obx(() => Column(
                      children: [
                        CommonButton(
                          isLoading: controller.isLoadingAcceptVerify.value,
                          text: 'Terima Pengajuan',
                          backgroundColor: greyColor.withOpacity(0.1),
                          textColor: blackColor,
                          onPressed: () {
                            controller.updateVerifyUserByAdmin(true);
                          },
                        ),
                        SizedBox(height: height * 0.01),
                        CommonButton(
                          isLoading: controller.isLoadingRejectVerify.value,
                          text: 'Tolak Pengajuan',
                          backgroundColor: dangerColor,
                          textColor: whiteColor,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CommonAlertDialog(
                                      title: 'Konfirmasi',
                                      content:
                                          'Apakah kamu yakin untuk menolak akun dan menghapus informasi akun?',
                                      cancelButtonText: 'Tidak',
                                      confirmButtonText: 'Iya',
                                      onConfirm: () async {
                                        Get.back();
                                        await controller
                                            .updateVerifyUserByAdmin(false);
                                      });
                                });
                          },
                        ),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
