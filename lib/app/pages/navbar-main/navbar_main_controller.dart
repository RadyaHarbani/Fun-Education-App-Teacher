import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/event-calendar-page/event_calendar_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_view.dart';
import 'package:get/get.dart';

class NavbarMainController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      currentIndex.value = Get.arguments;
    }
  }

  final List<Widget> pages = [
    HomePageView(),
    HomeSavingPageView(),
    // EventCalendarPageView(),
    GalleryPageView(),
  ];

  void selectedPage(int index) {
    currentIndex.value = index;
  }
}
