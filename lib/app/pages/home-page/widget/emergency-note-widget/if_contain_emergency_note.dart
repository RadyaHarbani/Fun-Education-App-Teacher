import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/api/emergency-note/models/file-emergency-note/file_emergency_note.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/pdf_viewer.dart';
import 'package:get/get.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class IfContainEmergencyNote extends GetView<HomePageController> {
  const IfContainEmergencyNote({
    Key? key,
    required this.emergencyNote,
    required this.informationFile,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  final String emergencyNote;
  final List<FileEmergencyNote> informationFile;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonWarning(
          backColor: warningColor,
          text:
              '"Edit Informasi" untuk mengubah atau menambahkan surat pemberitahuan',
        ),
        SizedBox(height: height * 0.02),
        AutoSizeText.rich(
          TextSpan(
            text: 'Informasi\n',
            style: tsTitleSmallRegular(blackColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text: 'Fun Education',
                style: tsTitleSmallSemibold(blackColor).copyWith(
                  height: 1.3,
                ),
              ),
            ],
          ),
          group: AutoSizeGroup(),
          maxLines: 2,
        ),
        SizedBox(height: height * 0.01),
        Row(
          children: [
            InkWell(
              onTap: onTapEdit,
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.007,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit_note_rounded,
                        color: blackColor,
                        size: 25,
                      ),
                      SizedBox(width: width * 0.01),
                      AutoSizeText(
                        'Edit Informasi',
                        group: AutoSizeGroup(),
                        style: tsBodySmallSemibold(blackColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: width * 0.02),
            InkWell(
              onTap: onTapDelete,
              child: Container(
                decoration: BoxDecoration(
                  color: dangerColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.007,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete_sweep_rounded,
                        color: dangerColor,
                        size: 23,
                      ),
                      SizedBox(width: width * 0.01),
                      AutoSizeText(
                        'Hapus Informasi',
                        group: AutoSizeGroup(),
                        style: tsBodySmallSemibold(dangerColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: greyColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Catatan :',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallRegular(blackColor),
                    ),
                    SizedBox(height: height * 0.01),
                    AutoSizeText(
                      '$emergencyNote',
                      group: AutoSizeGroup(),
                      style: tsBodySmallSemibold(blackColor),
                    ),
                  ],
                ),
                informationFile.isEmpty
                    ? SizedBox.shrink()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.03),
                          AutoSizeText(
                            'Surat Pemberitahuan:',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallRegular(blackColor),
                          ),
                          SizedBox(height: height * 0.01),
                          ListView.builder(
                            itemCount: informationFile.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    PdfViewer(
                                      url: informationFile[index]
                                          .file
                                          .toString(),
                                      fileName: informationFile[index].name!,
                                    ),
                                  );
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.007),
                                  decoration: BoxDecoration(
                                    color: whiteColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04,
                                      vertical: height * 0.017,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/icIconPdf.svg',
                                          height: height * 0.035,
                                        ),
                                        SizedBox(width: width * 0.025),
                                        Container(
                                          width: width * 0.6,
                                          child: AutoSizeText(
                                            '${informationFile[index].name}',
                                            group: AutoSizeGroup(),
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                tsBodySmallRegular(blackColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
