import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/widgets/unverified_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class UnverifiedStudentPageComponentFive extends StatelessWidget {
  const UnverifiedStudentPageComponentFive({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 0.03),
              width: width * 0.015,
              height: height * 0.04,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Flexible(
              child: AutoSizeText.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  text: 'Shift Jam 14.00 - 15.00',
                  style: tsBodyMediumSemibold(blackColor),
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return UnverifiedStudentItem(
              fullname: 'Radya Hukma Shabiyyaa Harbani',
              onTapClose: () {},
              onTapCheck: () {},
            );
          },
        )
      ],
    );
  }
}
