import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:overlap_stack/overlap_stack.dart';

class ListDetailSavingPageComponentOne extends StatelessWidget {
  const ListDetailSavingPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          TextSpan(
            text: 'Shift Masuk\n',
            style: tsBodySmallRegular(blackColor),
            children: [
              TextSpan(
                text: '08.00 - 10.00',
                style: tsTitleSmallSemibold(blackColor),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: height * 0.0435,
            width: width * 0.4,
            child: OverlapStack.builder(
              leadIndex: 4,
              itemLimit: 5,
              itemCount: 25,
              align: OverlapStackAlign.start,
              itemBuilder: (context, i) {
                return CircleAvatar(
                  foregroundImage: NetworkImage(
                    'https://i.pravatar.cc/50?u=$i',
                  ),
                );
              },
              infoBuilder: (context, remaining) {
                return CircleAvatar(
                  backgroundColor: whiteColor,
                  foregroundColor: blackColor,
                  child: AutoSizeText(
                    '+$remaining',
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    style: tsBodySmallRegular(blackColor),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}