import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/graduated_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/widgets/graduated_student_item.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class GraduatedStudentPageComponentOne
    extends GetView<GraduatedStudentPageController> {
  const GraduatedStudentPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.listGraduatedStudentOne.isNotEmpty
          ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: controller.listGraduatedStudentOne.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_GRADUATED_STUDENT_PAGE,
                      arguments: controller
                          .listGraduatedStudentOne[index].id
                          .toString(),
                    );
                  },
                  child: GraduatedStudentItem(
                    fullname: controller
                        .listGraduatedStudentOne[index].fullName!,
                    image: controller
                        .listGraduatedStudentOne[index].profilePicture!,
                  ));
            },
          )
          :  SizedBox.shrink(),
    );
  }
}
