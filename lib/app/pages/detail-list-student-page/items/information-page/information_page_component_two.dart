import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/learning_flow_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class InformationPageComponentTwo extends StatelessWidget {
  const InformationPageComponentTwo({super.key});

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
            SvgPicture.asset('assets/icons/icListTask.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText(
              'Alur Belajar Ananda',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
        SizedBox(height: height * 0.025),
        LearningFlowItem(
          title: 'Mengenalkan Buku A',
          point1: 'Menebalkan Huruf',
          point2: 'Membaca Kartu Baju Sampai Cabe',
        ),
      ],
    );
  }
}
