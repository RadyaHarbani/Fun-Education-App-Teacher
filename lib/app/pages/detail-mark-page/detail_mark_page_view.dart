import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/components/bottomsheet_add_mark.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/components/detail_mark_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/components/detail_mark_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/widgets/detail_mark_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailMarkPageView extends GetView<DetailMarkPageController> {
  const DetailMarkPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Nilai Tugas',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => DetailMarkItem(
                    type: 'Dikte',
                    title: 'Menulis 5 benda yang sering dilihat oleh ananda',
                    description:
                        'Berdasarkan gambar tersebut ambil lima barang yang ingin didiktekan, setelah selesai foto hasil tugas anak lalu kumpulkan.',
                    madeIn:
                        '${DateFormat('EEEE,\ndd MMMM').format(DateTime.now())}',
                    deadline:
                        '${DateFormat('EEEE,\ndd MMMM').format(DateTime.now())}',
                    status: '${controller.status.value}',
                  )),
              SizedBox(height: height * 0.02),
              DetailMarkPageComponentOne(),
              SizedBox(height: height * 0.02),
              DetailMarkPageComponentTwo(),
              SizedBox(height: height * 0.02),
              Obx(
                () => controller.status.value == 'Dikumpulkan'
                    ? CommonButton(
                        text: 'Beri Nilai',
                        backgroundColor: blackColor,
                        textColor: whiteColor,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: whiteColor,
                            builder: (context) => BottomsheetAddMark(),
                          );
                        },
                      )
                    : Container(
                        width: width,
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05,
                          vertical: height * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: controller.mark.value <= 50
                              ? dangerColor
                              : controller.mark.value <= 70
                                  ? warningColor
                                  : successColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AutoSizeText(
                          '${controller.mark.value}/100',
                          group: AutoSizeGroup(),
                          maxLines: 1,
                          style: tsBodySmallSemibold(whiteColor),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
