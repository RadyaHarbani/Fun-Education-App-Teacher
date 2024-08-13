import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/widgets/unverified_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class UnverifiedStudentPageComponentThree
    extends GetView<UnverifiedStudentPageController> {
  const UnverifiedStudentPageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Obx(
      () => controller.listUnverifiedStudentThree.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: width * 0.03),
                      width: width * 0.015,
                      height: height * 0.04,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText.rich(
                        textAlign: TextAlign.start,
                        TextSpan(
                          text: 'Shift Jam 11.30 - 13.00',
                          style: tsBodyMediumSemibold(blackColor),
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
                  itemCount: controller.listUnverifiedStudentThree.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.DETAIL_UNVERIFIED_STUDENT_PAGE,
                          arguments: controller
                              .listUnverifiedStudentThree[index].id
                              .toString(),
                        );
                      },
                      child: UnverifiedStudentItem(
                        fullname:
                            '${controller.listUnverifiedStudentThree[index].fullName}',
                        onTapClose: () {
                          controller.updateVerifyUserByAdmin(
                            controller.listUnverifiedStudentThree[index].id
                                .toString(),
                            false,
                          );
                        },
                        onTapCheck: () {
                          controller.updateVerifyUserByAdmin(
                            controller.listUnverifiedStudentThree[index].id
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
          : SizedBox(width: 0, height: 0),
    );
  }
}
