import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/widgets/mark_widget/mark_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ListOnprogressMark extends GetView<DetailTaskPageController> {
  const ListOnprogressMark({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/icDocument.svg',
            ),
            SizedBox(width: width * 0.02),
            AutoSizeText(
              'Dikumpulkan',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Obx(() {
          if (controller.isLoadingDetailTask.value) {
            return ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey[300],
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.025,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Container(
                                width: width * 0.3,
                                height: height * 0.025,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (controller.onProgressList.isEmpty) {
            return Column(
              children: [
                SizedBox(height: height * 0.04),
                SvgPicture.asset(
                  'assets/images/empty_list.svg',
                ),
                SizedBox(height: height * 0.01),
                Center(
                  child: AutoSizeText(
                    'Belum ada siswa\nyang mengumpulkan tugas',
                    textAlign: TextAlign.center,
                    group: AutoSizeGroup(),
                    style: tsBodySmallRegular(blackColor),
                  ),
                ),
                SizedBox(height: height * 0.04),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: controller.onProgressList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_MARK_PAGE,
                      arguments: controller.onProgressList[index].id.toString(),
                    );
                  },
                  child: MarkStudentItem(
                    studentName: '${controller.onProgressList[index].fullName}',
                    date:
                        '${DateFormat('EEEE, dd MMMM', 'id_ID').format(controller.onProgressList[index].createdAt!)}',
                    profiePicture:
                        controller.onProgressList[index].profilePicture!,
                    mark: '${controller.onProgressList[index].grade}',
                  ),
                );
              },
            );
          }
        }),
      ],
    );
  }
}
