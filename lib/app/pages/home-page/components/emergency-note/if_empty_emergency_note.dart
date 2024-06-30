import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class IfEmptyEmergencyNote extends StatelessWidget {
  const IfEmptyEmergencyNote({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/empty_message.svg',
        ),
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          textAlign: TextAlign.center,
          TextSpan(
            text: 'Belum Ada Catatan\n',
            style: tsBodyMediumSemibold(blackColor),
            children: [
              TextSpan(
                text: 'Buat Catatan Untuk Hal Mendesak',
                style: tsBodySmallRegular(blackColor),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.03),
        CommonButton(
          text: 'Buat Catatan',
          color: primaryColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
