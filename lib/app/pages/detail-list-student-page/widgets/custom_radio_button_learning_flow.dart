// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CustomRadioButtonLearningFlow extends StatelessWidget {
  const CustomRadioButtonLearningFlow({
    Key? key,
    required this.title,
    required this.point1,
    required this.point2,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);
  final String title;
  final String point1;
  final String point2;
  final String value;
  final String groupValue;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.01),
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.025,
            horizontal: width * 0.06,
          ),
          decoration: BoxDecoration(
            color: greyColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    '$title',
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  SizedBox(height: height * 0.01),
                  AutoSizeText(
                    '\u2022 $point1',
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    style: tsBodySmallRegular(blackColor),
                  ),
                  AutoSizeText(
                    '\u2022 $point2',
                    group: AutoSizeGroup(),
                    maxLines: 2,
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.005,
                  horizontal: width * 0.015,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: greyColor.withOpacity(0.1),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.008,
                    horizontal: width * 0.018,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: groupValue == value ? primaryColor : transparentColor,
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
