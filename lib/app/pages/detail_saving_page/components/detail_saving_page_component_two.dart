import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/widgets/outcoming_submission_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailSavingPageComponentTwo extends GetView<DetailSavingPageController> {
  const DetailSavingPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/icSubmission.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText(
              group: AutoSizeGroup(),
              maxLines: 1,
              'Pengajuan Pengeluaran',
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: greyColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.025,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                group: AutoSizeGroup(),
                maxLines: 1,
                'Pengeluaran diajukan untuk :',
                style: tsBodySmallRegular(blackColor),
              ),
              SizedBox(height: height * 0.02),
              Obx(
                () => controller.savingSubmissionModel.value.status == 'Pending'
                    ? OutcomingSubmissionItem(
                        titleSubmission:
                            controller.savingSubmissionModel.value.category ==
                                    'SPP'
                                ? 'SPP Bulanan'
                                : 'Kegiatan Belajar Diluar',
                        onTapClose: () {
                          controller.updateStatusSavingSubmission('Rejected');
                        },
                        onTapCheck: () {
                          controller.savingSubmissionModel.value.category ==
                                  'SPP'
                              ? controller
                                  .updateStatusSavingSubmission('Accepted')
                              : controller.updateStatusSavingSubmission(
                                  'Pending Accept');
                        },
                      )
                    : SizedBox.shrink(),
              ),
              Obx(
                () => controller.savingSubmissionModel.value.status ==
                        'Pending Accept'
                    ? CommonWarning(
                        backColor: warningColor,
                        text:
                            'Jangan Lupa Mencatat Pengeluaran Untuk Kegiatan Belajar Diluar',
                      )
                    : SizedBox.shrink(),
              )
            ],
          ),
        )
      ],
    );
  }
}
