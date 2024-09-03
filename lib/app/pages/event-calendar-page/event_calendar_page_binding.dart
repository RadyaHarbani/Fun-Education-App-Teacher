import 'package:fun_education_app_teacher/app/pages/event-calendar-page/event_calendar_page_controller.dart';
import 'package:get/get.dart';

class EventCalendarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventCalendarPageController>(
      () => EventCalendarPageController()
    );
  }
}