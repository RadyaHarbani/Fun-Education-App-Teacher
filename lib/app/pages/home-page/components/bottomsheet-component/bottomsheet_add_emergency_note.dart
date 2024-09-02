import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_multiline_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetAddEmergencyNote extends GetView<HomePageController> {
  const BottomsheetAddEmergencyNote({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.03,
            bottom: height * 0.015,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: width * 0.15,
                  height: height * 0.008,
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: width * 0.02),
                    width: width * 0.013,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      color: dangerColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  AutoSizeText.rich(
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    TextSpan(
                      text: 'Informasi Harian\n',
                      style: tsBodyMediumSemibold(blackColor).copyWith(
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: 'Berisi informasi ke wali murid',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              CommonMultilineTextfield(
                maxlines: 12,
                hintText: 'Masukkan Catatan',
                onChanged: (value) {},
                controller: controller.addEmergencyNoteController,
              ),
              SizedBox(height: height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText.rich(
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    TextSpan(
                      text: 'Surat Pemberitahuan\n',
                      style: tsBodyMediumSemibold(blackColor).copyWith(
                        height: 1.3,
                      ),
                      children: [
                        TextSpan(
                          text: '*opsional (pdf)',
                          style: tsBodySmallRegular(dangerColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Obx(() => ListView.builder(
                        itemCount: controller.selectedFiles.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final file = controller.selectedFiles[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: height * 0.007),
                            decoration: BoxDecoration(
                              color: dangerColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.017,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/icIconPdf.svg',
                                        height: height * 0.035,
                                      ),
                                      SizedBox(width: width * 0.025),
                                      Container(
                                        width: width * 0.6,
                                        child: AutoSizeText(
                                          file.name,
                                          group: AutoSizeGroup(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: tsBodySmallRegular(blackColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        controller.removeSelectedFile(index),
                                    child: Icon(
                                      Icons.delete_rounded,
                                      size: 23,
                                      color: dangerColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(height: height * 0.02),
                  CommonButton(
                    text: 'Pilih File',
                    backgroundColor: greyColor.withOpacity(0.1),
                    textColor: blackColor,
                    onPressed: () => controller.pickFile(),
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              Obx(() => CommonButton(
                    isLoading: controller.isLoadingAddBottomsheet.value,
                    text: 'Tambah Catatan',
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                    onPressed: () => controller.storeEmergencyNoteByAdmin(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
