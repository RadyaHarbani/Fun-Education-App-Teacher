import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/widgets/unverified_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class UnverifiedStudentPageComponentOne
    extends GetView<UnverifiedStudentPageController> {
  const UnverifiedStudentPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Obx(
      () => controller.listUnverifiedStudentOne.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: width * 0.03),
                      width: width * 0.012,
                      height: height * 0.03,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: 'Shift Jam 08.00 - 10.00',
                          style: tsBodyMediumRegular(blackColor),
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.listUnverifiedStudentOne.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.DETAIL_UNVERIFIED_STUDENT_PAGE,
                          arguments: controller
                              .listUnverifiedStudentOne[index].id
                              .toString(),
                        );
                      },
                      child: UnverifiedStudentItem(
                        fullname:
                            '${controller.listUnverifiedStudentOne[index].fullName}',
                        onTapClose: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CommonAlertDialog(
                                    title: 'Konfirmasi',
                                    content:
                                        'Apakah kamu yakin untuk menolak akun?',
                                    cancelButtonText: 'Tidak',
                                    confirmButtonText: 'Iya',
                                    onConfirm: () async {
                                      Get.back();
                                      await controller.updateVerifyUserByAdmin(
                                        controller
                                            .listUnverifiedStudentOne[index].id
                                            .toString(),
                                        false,
                                      );
                                      
                                    });
                              });
                        },
                        onTapCheck: () {
                          controller.updateVerifyUserByAdmin(
                            controller.listUnverifiedStudentOne[index].id
                                .toString(),
                            true,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            )
          : SizedBox.shrink(),
    );
  }
}
