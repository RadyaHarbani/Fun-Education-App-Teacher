// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class IfContainEmergencyNote extends StatelessWidget {
  const IfContainEmergencyNote({
    Key? key,
    required this.emergencyNote,
    required this.onTapEdit,
    required this.onTapDelete,
  }) : super(key: key);

  final String emergencyNote;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.025,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.015,
                          vertical: height * 0.008,
                        ),
                        child: Icon(
                          Icons.access_time_filled,
                          color: whiteColor,
                          size: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    AutoSizeText(
                      'Catatan Darurat',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: onTapEdit,
                      child: Icon(
                        Icons.edit_rounded,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    InkWell(
                      onTap: onTapDelete,
                      child: Icon(
                        Icons.delete_rounded,
                        color: primaryColor,
                        size: 24,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            AutoSizeText(
              '$emergencyNote',
              group: AutoSizeGroup(),
              maxLines: 2,
              style: tsBodySmallSemibold(blackColor),
            ),
          ],
        ),
      ),
    );
  }
}
