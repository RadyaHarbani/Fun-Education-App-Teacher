import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/graduated_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/widgets/graduated_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class GraduatedStudentPageComponentFour
    extends GetView<GraduatedStudentPageController> {
  const GraduatedStudentPageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Obx(
      () => controller.listGraduatedStudentFour.isNotEmpty
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
                          text: 'Shift Jam 13.00 - 14.00',
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
                  itemCount: controller.listGraduatedStudentFour.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.DETAIL_UNVERIFIED_STUDENT_PAGE,
                          arguments: controller
                              .listGraduatedStudentFour[index].id
                              .toString(),
                        );
                      },
                      child: GraduatedStudentItem(
                          fullname: controller
                              .listGraduatedStudentFour[index].fullName!,
                          image: controller
                              .listGraduatedStudentFour[index].profilePicture!,),
                    );
                  },
                ),
              ],
            )
          : SizedBox(width: 0, height: 0),
    );
  }
}
