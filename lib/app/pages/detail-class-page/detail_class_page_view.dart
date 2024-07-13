import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/components/detail_class_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/components/detail_class_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/components/detail_class_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/components/detail_class_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailClassPageView extends GetView<DetailClassPageController> {
  const DetailClassPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.03,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 15,
                ),
              ),
              SizedBox(height: height * 0.025),
              DetailClassComponentOne(),
              SizedBox(height: height * 0.02),
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
                        text: 'Laporan',
                      ),
                      Tab(
                        text: 'Peringkat',
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
                    DetailClassComponentTwo(),
                    DetailClassComponentThree(),
                    DetailClassComponentFour(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
