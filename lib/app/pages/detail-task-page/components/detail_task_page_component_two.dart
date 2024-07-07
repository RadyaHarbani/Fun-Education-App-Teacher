import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/items/mark-page/list_finished_mark.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/items/mark-page/list_onprogress_mark.dart';

class DetailTaskPageComponentTwo extends StatelessWidget {
  const DetailTaskPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      children: [
        ListOnprogressMark(),
        SizedBox(height: height * 0.02),
        ListFinishedMark(),
      ],
    );
  }
}
