import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/components/list_detail_saving_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/components/list_detail_saving_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/list_detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListDetailSavingPageView extends GetView<ListDetailSavingPageController> {
  const ListDetailSavingPageView({super.key});

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
            top: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: SmartRefresher(
            controller: controller.refreshController,
            onRefresh: () async {
              await controller
                  .showAllUserByIncomingShift(controller.incomingShift.value);
              controller.refreshController.refreshCompleted();
            },
            header: WaterDropHeader(
              complete: Text(
                'Refresh Completed',
                style: tsBodySmallRegular(blackColor),
              ),
              waterDropColor: primaryColor,
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
                ListDetailSavingPageComponentOne(),
                SizedBox(height: height * 0.03),
                Expanded(
                  child: ListDetailSavingPageComponentTwo(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
