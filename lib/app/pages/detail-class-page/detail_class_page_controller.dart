import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailClassPageController extends GetxController with SingleGetTickerProviderMixin{

  TabController? tabControllerAll;
  TabController? tabControllerHomework;
  
  @override
  void onInit() {
    super.onInit();
    tabControllerAll = TabController(length: 3, vsync: this);
    tabControllerHomework = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabControllerAll!.dispose();
    tabControllerHomework!.dispose();
  }
}