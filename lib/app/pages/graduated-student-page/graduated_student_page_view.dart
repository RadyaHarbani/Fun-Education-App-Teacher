import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/components/graduated_student_page_component_five.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/components/graduated_student_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/components/graduated_student_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/components/graduated_student_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/components/graduated_student_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/graduated_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/widgets/graduated_student_item.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/widgets/shift_filter_chip_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class GraduatedStudentPageView extends GetView<GraduatedStudentPageController> {
  const GraduatedStudentPageView({super.key});

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
          'Daftar Kelulusan Siswa',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.fetchAllGraduatedStudents();
          controller.refreshController.refreshCompleted();
        },
        header: WaterDropHeader(
          complete: Text(
            'Refresh Completed',
            style: tsBodySmallRegular(blackColor),
          ),
          waterDropColor: primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWarning(
                  backColor: warningColor,
                  text:
                      'Cek detail siswa untuk melihat informasi secara keseluruhan',
                ),
                SizedBox(height: height * 0.02),
                Row(
                  children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      size: 20,
                      color: blackColor,
                    ),
                    SizedBox(width: width * 0.01),
                    AutoSizeText(
                      'Filter Shift',
                      style: tsBodyMediumSemibold(blackColor),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                ShiftFilterChipItem(),
                SizedBox(height: height * 0.02),
                Obx(() => CommonTextField(
                      obscureText: false,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                      ),
                      fieldController: controller.searchController,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.searchController.text = '';
                          controller.searchQuery.value = '';
                          controller.filteredGraduatedStudents.clear();
                        },
                        icon: controller.searchQuery.value.isNotEmpty
                            ? Icon(
                                Icons.close_rounded,
                                size: 20,
                              )
                            : SizedBox.shrink(),
                      ),
                      hintText: 'Cari Nama Siswa...',
                      onSubmitted: (query) {
                        controller.searchQuery.value = query;
                        controller.searchController.text = query;
                        if (query.isEmpty) {
                          controller.fetchAllGraduatedStudents();
                        } else {
                          controller.searchUserGraduate(query);
                        }
                      },
                    )),
                SizedBox(height: height * 0.02),
                Obx(() {
                  if (controller.searchQuery.value.isNotEmpty &&
                      controller.selectedShift.value.isEmpty &&
                      controller.filteredGraduatedStudents.isNotEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.filteredGraduatedStudents.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.DETAIL_GRADUATED_STUDENT_PAGE,
                              arguments: controller
                                  .filteredGraduatedStudents[index].id
                                  .toString(),
                            );
                          },
                          child: GraduatedStudentItem(
                            fullname: controller
                                .filteredGraduatedStudents[index].fullName!,
                            image: controller.filteredGraduatedStudents[index]
                                .profilePicture!,
                          ),
                        );
                      },
                    );
                  } else if (controller.selectedShift.value.isNotEmpty) {
                    return Column(
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
                                  text:
                                      'Shift Jam ${controller.selectedShift.value}',
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
                          itemCount: controller
                              .filteredGraduatedStudentsByShift.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_GRADUATED_STUDENT_PAGE,
                                  arguments: controller
                                      .filteredGraduatedStudentsByShift[index]
                                      .id
                                      .toString(),
                                );
                              },
                              child: GraduatedStudentItem(
                                fullname: controller
                                    .filteredGraduatedStudentsByShift[index]
                                    .fullName!,
                                image: controller
                                    .filteredGraduatedStudentsByShift[index]
                                    .profilePicture!,
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else if (controller.filteredGraduatedStudents.isEmpty &&
                      controller.searchQuery.value.isNotEmpty &&
                      !controller.isLoadingFilterData.value &&
                      controller.searchController.text.isNotEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.1),
                          SvgPicture.asset(
                            'assets/images/empty_search.svg',
                          ),
                          SizedBox(height: height * 0.03),
                          AutoSizeText(
                            'Data Tidak Ditemukan',
                            style: tsBodySmallSemibold(blackColor),
                          ),
                        ],
                      ),
                    );
                  } else if (controller.isLoadingFetchAllData.value ||
                      controller.isLoadingFilterData.value) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: width * 0.5,
                            height: height * 0.045,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: height * 0.01),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: height * 0.08,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GraduatedStudentPageComponentOne(),
                        SizedBox(height: height * 0.02),
                        GraduatedStudentPageComponentTwo(),
                        SizedBox(height: height * 0.02),
                        GraduatedStudentPageComponentThree(),
                        SizedBox(height: height * 0.02),
                        GraduatedStudentPageComponentFour(),
                        SizedBox(height: height * 0.02),
                        GraduatedStudentPageComponentFive(),
                        SizedBox(height: height * 0.02),
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
