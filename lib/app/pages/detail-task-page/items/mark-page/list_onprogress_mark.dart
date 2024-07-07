import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/widgets/mark_widget/mark_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:intl/intl.dart';

class ListOnprogressMark extends StatelessWidget {
  const ListOnprogressMark({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/icListTask.svg',
                          ),
                          SizedBox(width: width * 0.02),
                          AutoSizeText(
                            'Dikumpulkan',
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodyMediumSemibold(blackColor),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.02),
                      ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MarkStudentItem(
                              studentName: 'Radya',
                              date:
                                  '${DateFormat('EEEE, dd MMMM').format(DateTime.now())}',
                              index: index,
                              mark: '0',
                            );
                          }),
      ],
    );
  }
}
