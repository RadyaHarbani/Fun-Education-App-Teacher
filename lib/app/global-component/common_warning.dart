import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonWarning extends StatelessWidget {
  final Color backColor;
  final IconData? icon;
  final String text;

  CommonWarning({
    Key? key,
    required this.backColor,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.035,
        vertical: height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backColor,
      ),
      child: Row(
        children: [
          if (icon != null) // Check if icon is provided
            Icon(
              icon,
              color: whiteColor,
              size: 25,
            ),
          if (icon != null) // Check if icon is provided
            SizedBox(width: width * 0.025),
          Flexible(
            child: AutoSizeText(
              text,
              maxLines: 5,
              style: GoogleFonts.poppins(
                color: whiteColor,
                fontWeight: FontWeight.w600,
                fontSize: figmaFontsize(11),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
