import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/button_class.dart';

class HomePageComponentTwo extends StatelessWidget {
  const HomePageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ButtonClass(shiftTime: '08.00 - 10.00', onTap: () {}),
            ),
            SizedBox(width: width * 0.02),
            Expanded(
              child: ButtonClass(shiftTime: '10.00 - 11.30', onTap: () {}),
            ),
          ],
        ),
        SizedBox(height: height * 0.01),
        Row(
          children: [
            Expanded(
              child: ButtonClass(shiftTime: '11.30 - 13.00', onTap: () {}),
            ),
            SizedBox(width: width * 0.02),
            Expanded(
              child: ButtonClass(shiftTime: '13.00 - 14.00', onTap: () {}),
            )
          ],
        ),
        SizedBox(height: height * 0.01),
        Row(
          children: [
            Expanded(
              child: ButtonClass(shiftTime: '14.00 - 15.00', onTap: () {}),
            ),
          ],
        ),
      ],
    );
  }
}
