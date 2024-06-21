import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/splash-screen/splash_screen_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.025,
                horizontal: width * 0.06,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primaryColor.withOpacity(0.1),
              ),
              child: SvgPicture.asset(
                'assets/icons/icLogoFunEducation.svg',
              ),
            ),
            SizedBox(height: height * 0.02),
            AutoSizeText(
              'Fun Education',
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
