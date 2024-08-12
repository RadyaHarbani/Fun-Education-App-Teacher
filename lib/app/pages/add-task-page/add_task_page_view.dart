import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/components/add_task_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/components/add_task_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/components/add_task_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/components/add_task_page_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddTaskPageView extends GetView<AddTaskPageController> {
  const AddTaskPageView({super.key});

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
          'Tugas Baru',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddTaskPageComponentOne(),
                SizedBox(height: height * 0.03),
                AddTaskPageComponentTwo(),
                SizedBox(height: height * 0.03),
                AddTaskPageComponentThree(),
                SizedBox(height: height * 0.03),
                AddTaskPageComponentFour(),
                SizedBox(height: height * 0.1),
                CommonButton(
                  isLoading: controller.isLoadingPostTask.value,
                  text: 'Tambah Tugas',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  icon: Icons.add_rounded,
                  onPressed: () {
                    controller.storeTaskByAdmin();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
