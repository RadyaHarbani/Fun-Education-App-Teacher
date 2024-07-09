import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CustomRadioButtonPeriod extends StatelessWidget {
  const CustomRadioButtonPeriod({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.style,
  }) : super(key: key);
  final String title;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.02),
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: style ?? tsBodyMediumSemibold(blackColor),
              ),
              Icon(
                Icons.check_circle,
                color: groupValue == value ? successColor : transparentColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
