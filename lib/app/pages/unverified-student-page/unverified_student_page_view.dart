import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_five.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/widgets/unverified_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class UnverifiedStudentPageView
    extends GetView<UnverifiedStudentPageController> {
  const UnverifiedStudentPageView({super.key});

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
          'List Pengajuan Akun',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.fetchAllUnverifiedStudents();
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
                          controller.filteredUnverifiedStudent.clear();
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
                        if (query.isNotEmpty) {
                          controller.searchUserUnverified(query);
                        } else {
                          controller.fetchAllUnverifiedStudents();
                        }
                      },
                    )),
                SizedBox(height: height * 0.02),
                Obx(() {
                  if (controller.filteredUnverifiedStudent.isNotEmpty &&
                      controller.searchQuery.isNotEmpty) {
                    return ListView.builder(
                      itemCount: controller.filteredUnverifiedStudent.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(
                              Routes.DETAIL_UNVERIFIED_STUDENT_PAGE,
                              arguments: controller
                                  .filteredUnverifiedStudent[index].id
                                  .toString(),
                            );
                          },
                          child: UnverifiedStudentItem(
                            fullname:
                                '${controller.filteredUnverifiedStudent[index].fullName}',
                            onTapClose: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CommonAlertDialog(
                                        title: 'Konfirmasi',
                                        content:
                                            'Apakah kamu yakin untuk menolak akun?',
                                        cancelButtonText: 'Tidak',
                                        confirmButtonText: 'Iya',
                                        onConfirm: () async {
                                          Get.back();
                                          await controller
                                              .updateVerifyUserByAdmin(
                                            controller
                                                .filteredUnverifiedStudent[
                                                    index]
                                                .id
                                                .toString(),
                                            false,
                                          );
                                        });
                                  });
                            },
                            onTapCheck: () {
                              controller.updateVerifyUserByAdmin(
                                controller.filteredUnverifiedStudent[index].id
                                    .toString(),
                                true,
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (controller.filteredUnverifiedStudent.isEmpty &&
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
                        UnverifiedStudentPageComponentOne(),
                        SizedBox(height: height * 0.02),
                        UnverifiedStudentPageComponentTwo(),
                        SizedBox(height: height * 0.02),
                        UnverifiedStudentPageComponentThree(),
                        SizedBox(height: height * 0.02),
                        UnverifiedStudentPageComponentFour(),
                        SizedBox(height: height * 0.02),
                        UnverifiedStudentPageComponentFive(),
                        SizedBox(height: height * 0.02),
                      ],
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
