import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_detail_image_page.dart';
import 'package:fun_education_app_teacher/app/global-component/common_grid_image_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/widgets/detail_mark_onprogress_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailMarkItem extends StatelessWidget {
  final DetailTaskPageController controller =
      Get.put(DetailTaskPageController());
  DetailMarkItem({
    Key? key,
    required this.type,
    required this.title,
    required this.description,
    required this.madeIn,
    required this.deadline,
    required this.status,
  }) : super(key: key);
  final String type;
  final String title;
  final String description;
  final String madeIn;
  final String deadline;
  final String status;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return status == 'Dikumpulkan'
        ? DetailMarkOnprogressItem(
            type: type,
            title: title,
            description: description,
            madeIn: madeIn,
            deadline: deadline,
            status: status,
          )
        : Container(
            decoration: BoxDecoration(
              color: type == 'Dikte & Menulis'
                  ? blueColor.withOpacity(0.1)
                  : type == 'Kreasi'
                      ? primaryColor.withOpacity(0.1)
                      : type == 'Membaca'
                          ? greenColor.withOpacity(0.1)
                          : warningColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: height * 0.03,
                bottom: height * 0.03,
                left: width * 0.06,
                right: width * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: type == 'Dikte & Menulis'
                                  ? blueColor.withOpacity(0.6)
                                  : type == 'Kreasi'
                                      ? primaryColor.withOpacity(0.6)
                                      : type == 'Membaca'
                                          ? greenColor.withOpacity(0.6)
                                          : warningColor.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.008,
                                horizontal: width * 0.05,
                              ),
                              child: AutoSizeText(
                                type,
                                group: AutoSizeGroup(),
                                maxLines: 1,
                                style: tsBodySmallSemibold(whiteColor),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Container(
                            decoration: BoxDecoration(
                              color: successColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.008,
                                horizontal: width * 0.05,
                              ),
                              child: AutoSizeText(
                                status,
                                group: AutoSizeGroup(),
                                maxLines: 1,
                                style: tsBodySmallSemibold(whiteColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.025),
                  AutoSizeText(
                    title,
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Dibuat pada :',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallRegular(blackColor),
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                color: type == 'Dikte & Menulis'
                                    ? blueColor
                                    : type == 'Kreasi'
                                        ? primaryColor
                                        : type == 'Membaca'
                                            ? greenColor
                                            : warningColor,
                                size: 26,
                              ),
                              SizedBox(width: width * 0.02),
                              AutoSizeText(
                                madeIn,
                                group: AutoSizeGroup(),
                                maxLines: 2,
                                style: tsBodySmallSemibold(blackColor)
                                    .copyWith(height: 1.2),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.1),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Waktu Tenggat :',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallRegular(blackColor),
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                color: dangerColor,
                                size: 26,
                              ),
                              SizedBox(width: width * 0.02),
                              AutoSizeText(
                                deadline,
                                group: AutoSizeGroup(),
                                maxLines: 2,
                                style: tsBodySmallSemibold(blackColor)
                                    .copyWith(height: 1.2),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Divider(
                    color: greyColor.withOpacity(0.1),
                    thickness: 1.5,
                  ),
                  SizedBox(height: height * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Deskripsi :',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodyMediumSemibold(blackColor),
                      ),
                      SizedBox(height: height * 0.02),
//kuncinya ada di argument

                      SizedBox(height: height * 0.02),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller
                                .showByTaskIdDetail.value.images?.length ??
                            0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: width * 0.02,
                          mainAxisSpacing: height * 0.01,
                          childAspectRatio: 1.4,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => CommonDetailImagePage(
                                  imagePath: controller.showByTaskIdDetail.value
                                      .images![index].image
                                      .toString(),
                                  isNetwork: true,
                                ),
                              );
                            },
                            child: CommonGridImageItem(
                              imagePath: controller
                                  .showByTaskIdDetail.value.images![index].image
                                  .toString(),
                              isDelete: false,
                              isNetwork: true,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      AutoSizeText(
                        '$description',
                        group: AutoSizeGroup(),
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
