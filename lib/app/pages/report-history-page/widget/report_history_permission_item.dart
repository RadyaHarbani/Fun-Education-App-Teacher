import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ReportHistoryPermissionItem extends StatelessWidget {
  final String permission;
  final DateTime selectedDate;
  final String note;
  final VoidCallback onTap;
  const ReportHistoryPermissionItem({
    Key? key,
    required this.permission,
    required this.selectedDate,
    required this.note,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              SvgPicture.asset('assets/images/empty_list.svg'),
              SizedBox(height: height * 0.02),
              AutoSizeText(
                'Laporan Ananda Izin',
                group: AutoSizeGroup(),
                textAlign: TextAlign.center,
                maxLines: 1,
                style: tsBodyMediumSemibold(blackColor),
              ),
              SizedBox(height: height * 0.005),
              AutoSizeText(
                'Lihat catatan di tanggal ${DateFormat('dd MMMM yyyy').format(selectedDate)}',
                group: AutoSizeGroup(),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: tsBodySmallRegular(blackColor),
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: whiteColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: note.isNotEmpty ? greenColor : greyColor.withOpacity(0.5),
                      ),
                      SizedBox(width: width * 0.02),
                      AutoSizeText(
                        note.isNotEmpty ? 'Lihat Catatan' : 'Tidak Ada Catatan',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodySmallSemibold(blackColor),
                      ),
                      SizedBox(width: width * 0.02),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: blackColor,
                        size: 13,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.05),
      ],
    );
  }
}
