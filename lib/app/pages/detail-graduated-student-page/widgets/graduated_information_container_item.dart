import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class GraduatedInformationContainerItem extends StatelessWidget {
  final String titleInformation;
  final String valueInformation;
  const GraduatedInformationContainerItem({
    Key? key,
    required this.titleInformation,
    required this.valueInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: whiteColor,
      ),
      child: AutoSizeText.rich(
        group: AutoSizeGroup(),
        maxLines: 4,
        TextSpan(
          children: [
            TextSpan(
              text: '$titleInformation\n',
              style: tsBodySmallRegular(greyColor).copyWith(
                height: 2.0,
              ),
            ),
            TextSpan(
              text: '$valueInformation',
              style: tsBodySmallSemibold(blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
