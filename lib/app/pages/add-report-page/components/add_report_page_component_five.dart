import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class AddReportPageComponentFive extends GetView<AddReportPageController> {
  const AddReportPageComponentFive({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Dikirimkan Kepada :',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        Obx(() {
          if (controller.isLoadingUserUndone.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Wrap(
                spacing: width * 0.025,
                runSpacing: height * 0.01,
                children: List.generate(6, (index) {
                  return Container(
                    width: width * 0.435,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  );
                }),
              ),
            );
          } else {
            return Wrap(
              spacing: width * 0.025,
              children: List.generate(
                controller.showUserUndoneModel.length,
                (index) {
                  final recipient = controller.showUserUndoneModel[index];
                  final isSelected = controller.selectedStudents
                      .any((s) => s.id == recipient.id);
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.01),
                    child: ChoiceChip(
                      avatar: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(recipient.profilePicture!),
                      ),
                      backgroundColor: whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      label: Text(
                        recipient.fullName!,
                        style: tsBodySmallSemibold(
                          isSelected ? whiteColor : blackColor,
                        ),
                      ),
                      side: BorderSide.none,
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: width * 0.02,
                        vertical: height * 0.005,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.008,
                      ),
                      selectedColor: successColor,
                      checkmarkColor: whiteColor,
                      selected: isSelected,
                      onSelected: (selected) {
                        controller.toggleRecipient(recipient);
                      },
                    ),
                  );
                },
              ),
            );
          }
        })
      ],
    );
  }
}
