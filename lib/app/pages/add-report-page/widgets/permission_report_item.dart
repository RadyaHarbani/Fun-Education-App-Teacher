import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class PermissionReportItem extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String) onChanged;
  const PermissionReportItem({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Expanded(
      child: InkWell(
        onTap: () => onChanged(value),
        child: Container(
          decoration: BoxDecoration(
            color: groupValue == value ? greenColor : whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.012,
            ),
            child: Center(
              child: AutoSizeText(
                '$title',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallSemibold(
                  groupValue == value ? whiteColor : blackColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
