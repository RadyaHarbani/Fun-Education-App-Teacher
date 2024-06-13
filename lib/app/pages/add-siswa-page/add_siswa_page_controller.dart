import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSiswaPageController extends GetxController {
  final namaLengkapController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final alamatLengkapController = TextEditingController();

  var selectedOption = ''.obs;

  void selectTime(String option) {
    selectedOption.value = option;
  }
}
