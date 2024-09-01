import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/otp-verification-page/otp_verification_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationPageView extends GetView<OtpVerificationPageController> {
  const OtpVerificationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.only(right: width * 0.03),
      width: width * 0.16,
      height: height * 0.08,
      textStyle: tsBodyLargeMedium(blackColor),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      maxLines: 2,
                      TextSpan(
                        text: 'Kode Verifikasi Email',
                        style: tsBodyLargeSemibold(blackColor),
                        children: [
                          TextSpan(
                            text: '\nKode akan dikirimkan melalui inbox email',
                            style: tsBodySmallRegular(blackColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Center(
                      child: Pinput(
                        length: 4,
                        defaultPinTheme: defaultPinTheme,
                        showCursor: true,
                        textInputAction: TextInputAction.next,
                        controller: controller.otpController,
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: primaryColor.withOpacity(0.1),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: primaryColor.withOpacity(0.05),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Obx(() {
                      if (controller.isLoadingResendOTP.value) {
                        return Center(
                          child: AutoSizeText(
                            textAlign: TextAlign.center,
                            'Kode OTP sedang dalam proses pengiriman tunggu sebentar yaa..',
                            style: tsBodySmallMedium(dangerColor),
                          ),
                        );
                      } else if (controller.count.value > 0) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              'Kode akan hangus dalam ',
                              group: AutoSizeGroup(),
                              maxLines: 1,
                              style: tsBodySmallRegular(blackColor),
                            ),
                            SizedBox(
                              width: width * 0.005,
                            ),
                            InkWell(
                              child: AutoSizeText(
                                controller.countDown.value,
                                style: tsBodyMediumSemibold(primaryColor),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: AutoSizeText(
                            textAlign: TextAlign.center,
                            'Yaah, kode OTP sudah hangus, silahkan kirim ulang kode',
                            style: tsBodySmallMedium(dangerColor),
                          ),
                        );
                      }
                    }),
                  ],
                ),
              ),
              Obx(() => CommonButton(
                    isLoading: controller.isLoadingVerifyOtp.value,
                    text: 'Verifikasi',
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.verifyOtp();
                    },
                  )),
              SizedBox(height: height * 0.01),
              Obx(() => CommonButton(
                    isLoading: controller.isLoadingResendOTP.value,
                    text: 'Kirim Ulang Kode',
                    backgroundColor: greyColor.withOpacity(0.1),
                    textColor: blackColor,
                    onPressed: () {
                      controller.resendOtp();
                    },
                  )),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
