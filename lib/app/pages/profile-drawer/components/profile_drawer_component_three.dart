import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProfileDrawerComponentThree extends StatelessWidget {
  final ProfileDrawerController controller = Get.put(ProfileDrawerController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Data Siswa',
          style: tsBodyMediumRegular(blackColor),
          maxLines: 1,
        ),
        SizedBox(height: height * 0.01),
        InkWell(
          onTap: () {
            controller.downloadExcel();
          },
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(() => controller.isDownloading.value == true
                ? Container(
                    height: height * 0.06,
                    child: Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: height * 0.03,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.02,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/icExcel.svg',
                        ),
                        SizedBox(width: width * 0.03),
                        AutoSizeText(
                          'Export Data Siswa',
                          style: tsBodySmallSemibold(greenColor),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  )),
          ),
        ),
      ],
    );
  }
}
