// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/task-widget/task_archive_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/task-widget/task_close_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.type,
    required this.title,
    required this.madeIn,
    required this.deadline,
    required this.status,
    this.widget,
  }) : super(key: key);
  final String type;
  final String title;
  final String madeIn;
  final String deadline;
  final String status;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return status == 'Diarsipkan'
        ? TaskArchiveItem(
            type: type,
            title: title,
            madeIn: madeIn,
            deadline: deadline,
            status: status,
            widget: widget!,
          )
        : status == 'Ditutup'
            ? TaskCloseItem(
                type: type,
                title: title,
                madeIn: madeIn,
                deadline: deadline,
                status: status,
              )
            : Container(
                margin: EdgeInsets.only(bottom: height * 0.02),
                decoration: BoxDecoration(
                  color: type == 'Dikte & Menulis'
                      ? blueColor.withOpacity(0.1)
                      : type == 'Kreasi'
                          ? primaryColor.withOpacity(0.1)
                          : type == 'Membaca'
                              ? greenColor.withOpacity(0.1)
                              : warningColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.02,
                    bottom: height * 0.03,
                    left: width * 0.05,
                    right: width * 0.05,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          widget!,
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
                      Divider(
                        color: greyColor.withOpacity(0.1),
                        thickness: 1.5,
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
                    ],
                  ),
                ),
              );
  }
}
