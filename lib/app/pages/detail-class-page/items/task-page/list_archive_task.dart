import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/task-widget/task_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:intl/intl.dart';

class ListArchiveTask extends StatelessWidget {
  const ListArchiveTask({super.key});

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
          widget: PopupMenuButton(
            color: whiteColor,
            onSelected: (value) {},
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  'Tutup',
                  style: tsBodySmallSemibold(blackColor),
                ),
                value: 'Tutup',
              ),
              PopupMenuItem(
                child: Text(
                  'Arsipkan',
                  style: tsBodySmallSemibold(blackColor),
                ),
                value: 'Arsip',
              ),
            ],
          ),
          status: 'Diarsipkan',
        );
      },
    );
  }
}