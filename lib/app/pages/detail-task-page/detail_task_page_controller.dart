import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTaskPageController extends GetxController with SingleGetTickerProviderMixin{
  TabController? tabControllerAll;

  @override
  void onInit() {
    super.onInit();
    tabControllerAll = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabControllerAll!.dispose();
  }
}