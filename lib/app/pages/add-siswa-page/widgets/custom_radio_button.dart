import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final TextStyle? style;
  final Color? color;

  CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.style,
    this.color,
  });

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
            vertical: height * 0.02,
            horizontal: width * 0.05,
          ),
          decoration: BoxDecoration(
            color: color ?? whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: style ?? tsBodySmallSemibold(blackColor),
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
                    color:
                        groupValue == value ? primaryColor : transparentColor,
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
