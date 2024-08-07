import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/components/detail_saving_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/components/detail_saving_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/components/detail_saving_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/components/detail_saving_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailSavingPageView extends GetView<DetailSavingPageController> {
  const DetailSavingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Detail Tabungan',
          style: tsBodyMediumSemibold(whiteColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await Future.delayed(Duration(milliseconds: 1000));
          controller.showTotalSavingsByUserId(controller.userId.value);
          controller.showSavingSubmissionByUserId(controller.userId.value);
          controller.showTransactionByUserId(controller.userId.value);
          controller.refreshController.refreshCompleted();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailSavingPageComponentOne(),
              SizedBox(height: height * 0.025),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Column(
                  children: [
                    DetailSavingPageComponentTwo(),
                    SizedBox(height: height * 0.03),
                    DetailSavingPageComponentThree(),
                    SizedBox(height: height * 0.03),
                    DetailSavingPageComponentFour(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
