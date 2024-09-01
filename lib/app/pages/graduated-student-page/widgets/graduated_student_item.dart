// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class GraduatedStudentItem extends StatelessWidget {
  final String fullname;
  final String image;
  const GraduatedStudentItem({
    Key? key,
    required this.fullname,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.01),
      padding: EdgeInsets.symmetric(
        vertical: height * 0.015,
        horizontal: width * 0.04,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: height * 0.05,
                width: width * 0.13,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: greyColor.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(
                    '$image',
                  ),
                ),
              ),
              SizedBox(width: width * 0.03),
              AutoSizeText(
                '$fullname',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallSemibold(blackColor),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: blackColor,
            size: 15,
          )
        ],
      ),
    );
  }
}
