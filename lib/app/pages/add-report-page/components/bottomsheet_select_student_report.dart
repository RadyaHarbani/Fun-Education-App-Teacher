import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class BottomsheetSelectStudentReport extends StatelessWidget {
  final AddReportPageController controller = AddReportPageController();
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.4 + MediaQuery.of(context).viewInsets.bottom,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.02,
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
                    text: 'Pilih Siswa\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Pilih Siswa yang Akan Diberikan Laporan',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
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
            }),
            // Expanded(
            //   child: Form(
            //     key: controller.formKeyShift,
            //     child: CommonTextField(
            //       fieldController: controller.shiftController,
            //       keyboardType: TextInputType.datetime,
            //       obscureText: false,
            //       hintText: 'cth : 08.00 - 10.00',
            //       validator: (value) {
            //         if (value!.isEmpty) {
            //           return 'Kolom tidak boleh kosong';
            //         }
            //         return null;
            //       },
            //     ),
            //   ),
            // ),
            CommonButton(
              text: 'Pilih Siswa',
              backgroundColor: blackColor,
              textColor: whiteColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
