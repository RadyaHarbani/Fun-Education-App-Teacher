import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/task-widget/task_item.dart';
import 'package:intl/intl.dart';

class ListCloseTask extends StatelessWidget {
  const ListCloseTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return TaskItem(
          type: 'Kreasi',
          title: 'Mewarnai gambar dengan menggunakan origami',
          madeIn: '${DateFormat('EEEE,\ndd MMMM').format(DateTime.now())}',
          deadline: '${DateFormat('EEEE,\ndd MMMM').format(DateTime.now())}',
          status: 'Ditutup',
        );
      },
    );
  }
}