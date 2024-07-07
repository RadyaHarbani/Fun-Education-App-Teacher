import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/widgets/task_widget/detail_task_item.dart';
import 'package:intl/intl.dart';

class DetailTaskPageComponentOne extends StatelessWidget {
  const DetailTaskPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailTaskItem(
          type: 'Dikte & Menulis',
          title: 'Menulis 5 benda yang sering dilihat oleh ananda',
          description:
              'Ananda diminta untuk menulis 5 benda yang sering dilihat oleh ananda',
          madeIn: '${DateFormat('EEEE,\ndd MMMM').format(DateTime.now())}',
          deadline: '${DateFormat('EEEE,\ndd MMMM').format(DateTime.now())}',
          status: 'Terbaru',
          function1: () {},
          function2: () {},
        )
      ],
    );
  }
}
