import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentPageController extends GetxController {
  final namaLengkapController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final alamatLengkapController = TextEditingController();

  RxBool isObsecure = false.obs;
  var selectedOption = ''.obs;

  void selectShift(String option) {
    selectedOption.value = option;
  }
}
