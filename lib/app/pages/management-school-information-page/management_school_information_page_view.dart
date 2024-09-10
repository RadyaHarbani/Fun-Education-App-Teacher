import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/management-school-information-page/management_school_information_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManagementSchoolInformationPageView
    extends GetView<ManagementSchoolInformationPageController> {
  const ManagementSchoolInformationPageView({super.key});

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
          'Informasi Sekolah',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.showAllSchoolInformation();
          controller.refreshController.refreshCompleted();
        },
        header: WaterDropHeader(
          complete: Text(
            'Refresh Selesai',
            style: tsBodySmallRegular(blackColor),
          ),
          waterDropColor: primaryColor,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: height * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: width * 0.03),
                              width: width * 0.016,
                              height: height * 0.06,
                              decoration: BoxDecoration(
                                color: warningColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            AutoSizeText(
                              'Hal - hal yang perlu diperhatikan\norangtua',
                              group: AutoSizeGroup(),
                              maxLines: 2,
                              style: tsBodyMediumSemibold(blackColor).copyWith(
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Obx(() => ListView.builder(
                              itemCount:
                                  controller.schoolInformationTitleModel.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, parentIndex) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: height * 0.02,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.1,
                                              vertical: height * 0.01,
                                            ),
                                            child: AutoSizeText(
                                              controller
                                                  .schoolInformationTitleModel[
                                                      parentIndex]
                                                  .title
                                                  .toString(),
                                              group: AutoSizeGroup(),
                                              maxLines: 1,
                                              style: tsBodySmallSemibold(
                                                  whiteColor),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  Routes
                                                      .EDIT_MANAGEMENT_SCHOOL_INFORMATION_PAGE,
                                                  arguments: {
                                                    'id': controller
                                                        .schoolInformationTitleModel[
                                                            parentIndex]
                                                        .id,
                                                    'title': controller
                                                        .schoolInformationTitleModel[
                                                            parentIndex]
                                                        .title,
                                                    'description': controller
                                                        .schoolInformationTitleModel[
                                                            parentIndex]
                                                        .description!
                                                  });
                                            },
                                            child: Icon(
                                              Icons.edit_rounded,
                                              color: blackColor,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: height * 0.01),
                                      ListView.builder(
                                        itemCount: controller
                                            .schoolInformationTitleModel[
                                                parentIndex]
                                            .description!
                                            .length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, childIndex) {
                                          return Container(
                                            margin: EdgeInsets.only(
                                                top: height * 0.01),
                                            child: AutoSizeText(
                                              '\u2022 ${controller.schoolInformationTitleModel[parentIndex].description![childIndex].body}',
                                              group: AutoSizeGroup(),
                                              style: tsBodySmallRegular(
                                                blackColor,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                CommonButton(
                  text: 'Tambah Kolom',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    Get.toNamed(Routes.ADD_MANAGEMENT_SCHOOL_INFORMATION_PAGE);
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
