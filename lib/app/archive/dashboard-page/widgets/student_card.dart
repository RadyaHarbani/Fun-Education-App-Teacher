import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class StudentCard extends StatelessWidget {
  final String name;
  final String initials;
  const StudentCard({super.key, required this.name, required this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10)
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: AutoSizeText.rich(TextSpan(
                text: initials, style: tsBodyMediumSemibold(whiteColor))),
            backgroundColor: greenColor,
          ),
          SizedBox(width: 16),
          AutoSizeText.rich(
              TextSpan(text: name, style: tsBodySmallSemibold(blackColor))),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 15, color: blackColor),
        ],
      ),
    );
  }
}
