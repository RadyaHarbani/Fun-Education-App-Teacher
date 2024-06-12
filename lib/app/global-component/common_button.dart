import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final IconData? icon;

  CommonButton({
    Key? key,
    required this.text,
    this.onPressed,
    required this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: width,
        height: height * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText.rich(
                TextSpan(text: text, style: tsBodyMediumSemibold(whiteColor))),
            if (icon != null) ...[
              SizedBox(width: 10),
              Icon(
                icon,
                color: whiteColor,
                size: 22,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
