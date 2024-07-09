// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class SelectPointItem extends GetView<AddReportPageController> {
  SelectPointItem({
    required this.pointName,
    required this.pointType,
    required this.selectedPointType,
    required this.onChanged,
  });

  final String pointName;
  final List pointType;
  final String selectedPointType;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    return Row(
      children: [
        Container(
          width: width * 0.5,
          child: AutoSizeText(
            '$pointName',
            group: AutoSizeGroup(),
            maxLines: 2,
            style: tsBodySmallSemibold(blackColor),
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
          ),
          decoration: BoxDecoration(
            color: greyColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButton<String>(
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: blackColor,
              size: 25,
            ),
            underline: SizedBox(
              width: 0,
              height: 0,
            ),
            value: selectedPointType,
            items: pointType
                .map((data) => DropdownMenuItem<String>(
                      value: data,
                      child: AutoSizeText(
                        data,
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodySmallSemibold(blackColor),
                      ),
                    ))
                .toList(),
            onChanged: (value) => onChanged(value!),
          ),
        ),
      ],
    );
  }
}
