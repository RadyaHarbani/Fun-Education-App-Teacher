// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class RankItem extends StatelessWidget {
  const RankItem({
    Key? key,
    required this.index,
    required this.backgroundContainerColor,
    required this.studentName,
    required this.point,
  }) : super(key: key);

  final int index;
  final Color backgroundContainerColor;
  final String studentName;
  final String point;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.05,
      ),
      decoration: BoxDecoration(
        color: backgroundContainerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            '${index + 1}    $studentName',
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodySmallSemibold(blackColor),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: AutoSizeText.rich(
              TextSpan(
                text: '$point',
                style: tsBodySmallSemibold(whiteColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
