import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_view.dart';
import 'package:get/get.dart';

class NavbarMainController extends GetxController {
  var currentIndex = 0.obs;
  final List<Widget> pages = [
    HomePageView(),
    HomeSavingPageView(),
    GalleryPageView(),
  ];

  void selectedPage (int index) {
    currentIndex.value = index;
  }
}
