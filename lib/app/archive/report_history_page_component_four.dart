// import 'package:flutter/material.dart';
// import 'package:fun_education_app_teacher/app/pages/detail-report-page/widgets/report_list_item.dart';
// import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
// import 'package:fun_education_app_teacher/common/helper/themes.dart';
// import 'package:get/get.dart';

// class ReportHistoryPageComponentFour
//     extends GetView<ReportHistoryPageController> {
//   const ReportHistoryPageComponentFour({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final Size mediaQuery = MediaQuery.of(context).size;
//     final double height = mediaQuery.height;
//     final double width = mediaQuery.width;
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: width * 0.035,
//         vertical: height * 0.01,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: greyColor.withOpacity(0.05),
//       ),
//       child: Obx(() => ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: controller.showGradeModel.length,
//             itemBuilder: (context, index) {
//               return ReportListItem(
//                 no: index + 1,
//                 text: '${controller.showGradeModel[index].activity}',
//                 point: '${controller.showGradeModel[index].grade}',
//               );
//             },
//           )),
//     );
//   }
// }
