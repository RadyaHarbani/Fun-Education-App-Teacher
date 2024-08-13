// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class UnverifiedStudentItem extends StatelessWidget {
  final String fullname;
  final VoidCallback onTapClose;
  final VoidCallback onTapCheck;
  const UnverifiedStudentItem({
    Key? key,
    required this.fullname,
    required this.onTapClose,
    required this.onTapCheck,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.06,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * 0.45,
            child: AutoSizeText.rich(
              textAlign: TextAlign.start,
              TextSpan(
                text: '$fullname',
                style: tsBodySmallSemibold(blackColor).copyWith(
                  height: 1.3,
                ),
              ),
              maxLines: 2,
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: onTapClose,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    size: 15,
                    color: blackColor,
                  ),
                ),
              ),
              SizedBox(width: width * 0.01),
              InkWell(
                onTap: onTapCheck,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: height * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: successColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: 15,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
