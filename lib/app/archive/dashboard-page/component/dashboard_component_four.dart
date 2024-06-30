import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/archive/dashboard-page/widgets/student_card.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DashboardComponentFour extends StatelessWidget {
  const DashboardComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 0.03),
              width: width * 0.016,
              height: height * 0.05,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Flexible(
              child: AutoSizeText.rich(
                textAlign: TextAlign.start,
                TextSpan(
                    text: 'Shift Jam 08.00 - 10.00',
                    style: tsBodyMediumSemibold(blackColor)),
                maxLines: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return StudentCard(
                name: 'Ratih Shinta Puspitasari', initials: 'RS');
          },
        ),
      ],
    );
  }
}
