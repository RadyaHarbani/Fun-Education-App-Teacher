import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/widgets/report_list_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailReportPageComponentThree extends StatelessWidget {
  const DetailReportPageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.035,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: greyColor.withOpacity(0.05),
      ),
      child: Column(
        children: [
          ReportListItem(
            no: 1,
            text: 'Datang tepat pada waktunya',
            point: 'A',
          ),
          ReportListItem(
            no: 2,
            text: 'Berpakaian rapi',
            // point: 'B',
            point: 'C',
          ),
          ReportListItem(
            no: 3,
            text: 'Berbuat baik dengan teman',
            point: 'A',
          ),
          ReportListItem(
            no: 4,
            text: 'Mau menolong dan berbagi dengan teman',
            point: 'A',
          ),
          ReportListItem(
            no: 5,
            text: 'Merapikan alat belajar dan mainan sendiri',
            point: 'C',
          ),
          ReportListItem(
            no: 6,
            text: 'Menyelesaikan tugas',
            point: 'A',
          ),
          ReportListItem(
            no: 7,
            text: 'Membaca',
            point: 'A',
          ),
          ReportListItem(
            no: 8,
            text: 'Menulis',
            point: 'C',
          ),
          ReportListItem(
            no: 9,
            text: 'Dikte',
            point: 'B',
          ),
          ReportListItem(
            no: 10,
            text: 'Keterampilan',
            point: 'A',
          ),
        ],
      ),
    );
  }
}
