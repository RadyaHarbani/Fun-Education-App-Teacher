import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/custom_radio_button_learning_flow.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetEditLearningFlow
    extends GetView<DetailListStudentPageController> {
  const BottomsheetEditLearningFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.78,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.03,
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.15,
              height: height * 0.008,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  width: width * 0.013,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Alur Belajar Ananda\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Apa saja yang akan dipelajari?',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.04),
            Expanded(
              child: Obx(
                () => Column(
                  children: [
                    CustomRadioButtonLearningFlow(
                      title: 'Mengenalkan buku A',
                      point1: 'Menebalkan Huruf',
                      point2: 'Membaca Kartu Baju Sampai Cabe',
                      value: 'A',
                      groupValue: controller.selectedLearningFlow.value,
                      onChanged: (value) =>
                          controller.selectedLearningFlow(value),
                    ),
                    CustomRadioButtonLearningFlow(
                      title: 'Mengenalkan buku B',
                      point1: 'Mencontoh Suku Kata',
                      point2: 'Membaca Kartu Dadu Sampai Payung',
                      value: 'B',
                      groupValue: controller.selectedLearningFlow.value,
                      onChanged: (value) =>
                          controller.selectedLearningFlow(value),
                    ),
                    CustomRadioButtonLearningFlow(
                      title: 'Mengenalkan buku C',
                      point1: 'Menyalin Kalimat',
                      point2: 'Membaca Kartu Rambutan Sampai Zahra',
                      value: 'C',
                      groupValue: controller.selectedLearningFlow.value,
                      onChanged: (value) =>
                          controller.selectedLearningFlow(value),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Obx(() => CommonButton(
                  isLoading: controller.isLoadingUpdateLearningFlow.value,
                  text: 'Tingkatkan',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    controller.updateLearningFlowByAdmin();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
