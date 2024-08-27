import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/widget/calendar_marker.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReportHistoryPageComponentTwo
    extends GetView<ReportHistoryPageController> {
  const ReportHistoryPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Obx(
      () => TableCalendar(
        rowHeight: height * 0.06,
        holidayPredicate: (day) {
          return day.weekday == 7 || day.weekday == 6;
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: tsBodyMediumSemibold(blackColor),
          leftChevronIcon: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.035,
              vertical: height * 0.018,
            ),
            decoration: BoxDecoration(
              color: transparentColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: blackColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 15,
            ),
          ),
          rightChevronIcon: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.035,
              vertical: height * 0.018,
            ),
            decoration: BoxDecoration(
              color: transparentColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: blackColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
          ),
          headerPadding: EdgeInsets.only(
            bottom: height * 0.02,
          ),
        ),
        locale: 'id_ID',
        focusedDay: controller.focusedDay.value,
        firstDay: DateTime.utc(2021, 1, 1),
        lastDay: DateTime.utc(2024, 12, 31),
        selectedDayPredicate: (day) {
          return isSameDay(controller.selectedDay.value, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          controller.onDaySelected(selectedDay, focusedDay);
        },
        onPageChanged: (focusedDay) {
          controller.focusedDay.value = focusedDay;
        },
        eventLoader: (day) {
          final events = controller.events.value[day] ?? [];
          return events;
        },
        calendarBuilders: CalendarBuilders(
          markerBuilder: (context, date, events) {
            if (events.isNotEmpty) {
              return CalendarMarker();
            }
            return SizedBox();
          },
        ),
        calendarFormat: CalendarFormat.month,
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            color: primaryColor.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: primaryColor.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
          selectedTextStyle: tsBodyMediumSemibold(whiteColor),
          todayTextStyle: tsBodyMediumSemibold(whiteColor),
          defaultTextStyle: tsBodyMediumRegular(blackColor),
          holidayTextStyle: tsBodyMediumRegular(dangerColor),
          holidayDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: whiteColor,
          ),
          outsideDaysVisible: false,
        ),
      ),
    );
  }
}
