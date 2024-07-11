import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/login-page/login_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: height * 0.03,
              left: width * 0.05,
              right: width * 0.05,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icLogoFunEducation.svg',
                      width: width * 0.08,
                    ),
                    SizedBox(width: width * 0.01),
                    AutoSizeText(
                      'Fun Education',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodyLargeSemibold(primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04),
                Column(
                  children: [
                    SvgPicture.asset('assets/images/welcome_login_page.svg'),
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Selamat Datang di\n',
                        style: tsTitleMediumRegular(blackColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Fun Education',
                            style: tsTitleMediumSemibold(blackColor),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
                SizedBox(height: height * 0.06),
                CommonWarning(
                  backColor: warningColor,
                  text: 'Isi dengan kata sandi yang telah diberikan oleh guru',
                ),
                SizedBox(height: height * 0.03),
                Column(
                  children: [
                    CommonTextField(
                      fieldController: controller.usernameController,
                      obscureText: false,
                      hintText: 'Nama Panggilan',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: height * 0.01),
                    Obx(
                      () => CommonTextField(
                        fieldController: controller.passwordController,
                        obscureText: controller.isObsecure.value,
                        hintText: 'Kata Sandi',
                        keyboardType: TextInputType.name,
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.isObsecure.value =
                                !controller.isObsecure.value;
                          },
                          icon: Icon(
                            controller.isObsecure.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20,
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Obx(() => CommonButton(
                      isLoading: controller.isLoading.value,
                      text: 'Masuk',
                      backgroundColor: blackColor,
                      textColor: whiteColor,
                      onPressed: () {
                        controller.login();
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
