import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/components/bottomsheet_edit_learning_flow.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/learning_flow_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class InformationPageComponentTwo
    extends GetView<DetailListStudentPageController> {
  const InformationPageComponentTwo({super.key});

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
            SvgPicture.asset('assets/icons/icListTask.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText(
              'Alur Belajar Ananda',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
        SizedBox(height: height * 0.025),
        InkWell(onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: whiteColor,
            builder: (context) => BottomsheetEditLearningFlow(),
          );
        }, child: Obx(() {
          if (controller.isLoadingDetailListStudent.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          } else if (controller.learningFlowModel.value.tahap == 'A') {
            return LearningFlowItem(
              title: 'Mengenalkan Buku A',
              point1: 'Menebalkan Huruf',
              point2: 'Membaca Kartu Baju Sampai Cabe',
            );
          } else if (controller.learningFlowModel.value.tahap == 'B') {
            return LearningFlowItem(
              title: 'Mengenalkan Buku B',
              point1: 'Menebalkan Huruf',
              point2: 'Membaca Kartu Dadu Sampai Payung',
            );
          } else {
            return LearningFlowItem(
              title: 'Mengenalkan Buku C',
              point1: 'Menebalkan Huruf',
              point2: 'Membaca Kartu Rambutan Sampai Zahra',
            );
          }
        })),
      ],
    );
  }
}
