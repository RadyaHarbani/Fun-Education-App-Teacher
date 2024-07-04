import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/task-page/list_archive_task.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/task-page/list_close_task.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/task-page/list_new_task.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/tab_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailClassComponentTwo extends GetView<DetailClassPageController> {
  const DetailClassComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 2,
              TextSpan(
                text: 'Tugas Ananda\n',
                style: tsBodyLargeSemibold(blackColor),
                children: [
                  TextSpan(
                    text:
                        '${DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now())}',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.012,
                  horizontal: width * 0.07,
                ),
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    AutoSizeText(
                      'Tugas Baru',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallMedium(whiteColor),
                    ),
                    SizedBox(width: width * 0.02),
                    Icon(
                      Icons.add_rounded,
                      color: whiteColor,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width,
          child: TabBar(
            controller: controller.tabControllerHomework,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: primaryColor,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            dividerColor: Colors.transparent,
            labelColor: primaryColor,
            unselectedLabelColor: greyColor,
            tabs: [
              TabItem(title: 'Terbaru', count: 1),
              TabItem(title: 'Ditutup', count: 10),
              TabItem(title: 'Diarsipkan', count: 5),
            ],
          ),
        ),
        SizedBox(height: height * 0.015),
        Expanded(
          child: TabBarView(
            controller: controller.tabControllerHomework,
            children: [
              ListNewTask(),
              ListCloseTask(),
              ListArchiveTask(),
            ],
          ),
        ),
      ],
    );
  }
}
