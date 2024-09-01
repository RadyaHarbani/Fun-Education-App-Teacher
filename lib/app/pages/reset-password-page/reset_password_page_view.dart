import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/reset-password-page/reset_password_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class ResetPasswordPageView extends GetView<ResetPasswordPageController> {
  const ResetPasswordPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: height * 0.03),
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      textAlign: TextAlign.left,
                      TextSpan(
                        text: 'Reset Password Untuk Akses\n',
                        style: tsBodyLargeSemibold(blackColor).copyWith(
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: 'Fun Education',
                            style: tsBodyLargeRegular(blackColor),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                    SizedBox(height: height * 0.02),
                    CommonWarning(
                      backColor: warningColor,
                      text: 'Selalu ingat kata sandinya ya...',
                    ),
                    SizedBox(height: height * 0.02),
                    Obx(() {
                      return Form(
                        key: controller.formKeyConfirmResetPassword,
                        child: Column(
                          children: [
                            CommonTextField(
                              fieldController: controller.passwordController,
                              obscureText: controller.isVisibleSignIn.value,
                              hintText: 'Kata Sandi Baru',
                              keyboardType: TextInputType.name,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isVisibleSignIn.value =
                                      !controller.isVisibleSignIn.value;
                                },
                                icon: Icon(
                                  controller.isVisibleSignIn.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                  color: greyColor,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Kata sandi tidak boleh kosong';
                                }
                              },
                            ),
                            SizedBox(height: height * 0.01),
                            CommonTextField(
                              fieldController:
                                  controller.confirmPasswordController,
                              obscureText:
                                  controller.isVisibleSignInConfirm.value,
                              hintText: 'Konfirmasi Kata Sandi Baru',
                              keyboardType: TextInputType.name,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.isVisibleSignInConfirm.value =
                                      !controller.isVisibleSignInConfirm.value;
                                },
                                icon: Icon(
                                  controller.isVisibleSignInConfirm.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                  color: greyColor,
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Konfirmasi kata sandi tidak boleh kosong';
                                } else if (value !=
                                    controller.passwordController.text) {
                                  return 'Kata sandi tidak sama';
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Obx(() => CommonButton(
                    isLoading: controller.isLoadingResetPassword.value,
                    text: 'Reset Password',
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.updateResetPassword();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
