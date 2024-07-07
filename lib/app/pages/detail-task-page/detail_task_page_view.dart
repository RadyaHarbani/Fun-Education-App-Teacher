import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/components/detail_task_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/components/detail_task_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailTaskPageView extends GetView<DetailTaskPageController> {
  const DetailTaskPageView({super.key});

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
          'Detail Tugas',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.01,
        ),
        child: Column(
          children: [
            Container(
              height: height * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: greyColor.withOpacity(0.05),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                  vertical: height * 0.005,
                ),
                child: TabBar(
                  controller: controller.tabControllerAll,
                  labelStyle: tsBodySmallSemibold(blackColor),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: blackColor,
                  unselectedLabelColor: greyColor,
                  tabs: [
                    Tab(
                      text: 'Tugas',
                    ),
                    Tab(
                      text: 'Nilai',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabControllerAll,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  DetailTaskPageComponentOne(),
                  DetailTaskPageComponentTwo(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
