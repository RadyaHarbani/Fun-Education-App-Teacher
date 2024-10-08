import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class InformationPageComponentOne
    extends GetView<DetailListStudentPageController> {
  const InformationPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Obx(() {
      if (controller.isLoadingDetailListStudent.value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width * 0.2,
                height: height * 0.02,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(height: height * 0.005),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width * 0.35,
                height: height * 0.035,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
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
                    text: '${controller.detailInformationUser.value.fullName}',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: whiteColor,
              ),
              child: AutoSizeText.rich(
                group: AutoSizeGroup(),
                maxLines: 2,
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Tempat, Tanggal Lahir\n',
                      style: tsBodySmallRegular(greyColor).copyWith(
                        height: 2.0,
                      ),
                    ),
                    TextSpan(
                      text: '${controller.detailInformationUser.value.birth}',
                      style: tsBodySmallSemibold(blackColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: whiteColor,
              ),
              child: AutoSizeText.rich(
                group: AutoSizeGroup(),
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Alamat Lengkap\n',
                      style: tsBodySmallRegular(greyColor).copyWith(
                        height: 2.0,
                      ),
                    ),
                    TextSpan(
                      text: '${controller.detailInformationUser.value.address}',
                      style: tsBodySmallSemibold(blackColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            CommonButton(
              text: 'Edit Informasi',
              backgroundColor: primaryColor,
              textColor: whiteColor,
              icon: Icons.edit_rounded,
              onPressed: () {
                Get.toNamed(
                  Routes.EDIT_INFORMATION_STUDENT_PAGE,
                  arguments: {
                    'userId': controller.detailInformationUser.value.id,
                    'fullName': controller.detailInformationUser.value.fullName,
                    'nickName': controller.detailInformationUser.value.nickname,
                    'gender': controller.detailInformationUser.value.gender,
                    'birth': controller.detailInformationUser.value.birth,
                    'address': controller.detailInformationUser.value.address,
                    'shift': controller.detailInformationUser.value.shift,
                    'learningFlow': controller.learningFlowModel.value.tahap,
                  },
                );
              },
            ),
          ],
        );
      }
    });
  }
}
