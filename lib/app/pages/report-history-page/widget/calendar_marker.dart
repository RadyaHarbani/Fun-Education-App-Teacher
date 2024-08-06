import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CalendarMarker extends StatelessWidget {
  const CalendarMarker({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
      ),
      width: width * 0.02,
      height: height * 0.02,
    );
  }
}
