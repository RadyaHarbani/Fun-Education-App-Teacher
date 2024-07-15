import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/app/pages/list-student-page/list_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ListStudentPageView extends GetView<ListStudentPageController> {
  const ListStudentPageView({super.key});

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
          'List Siswa',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.showCurrentUserModel.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_LIST_STUDENT_PAGE,
                        arguments: controller.showCurrentUserModel[index].id,
                      );
                    },
                    child: ReportItem(
                      name:
                          '${controller.showCurrentUserModel[index].fullName}',
                      image:
                          '${controller.showCurrentUserModel[index].profilePicture}',
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
