import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';

class ListDetailSavingPageComponentTwo extends StatelessWidget {
  const ListDetailSavingPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ReportItem(
              name: 'Syahran Fadhil',
              image: 'https://i.pravatar.cc/50?u=$index',
            ),
          );
        });
  }
}
