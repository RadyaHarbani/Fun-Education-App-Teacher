import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditReportPageController extends GetxController {
  TextEditingController teachersNote = TextEditingController();
  List<String> pointType = ['A', 'B', 'C'];
  List<RxString> points = List.generate(10, (_) => 'A'.obs);
  List<String> pointNames = [
    'Datang Tepat Pada Waktunya',
    'Berpakaian Rapi',
    'Berbuat Baik Dengan Teman',
    'Mau Menolong dan Berbagi Dengan Teman',
    'Merapikan Alat Belajar dan Mainan Sendiri',
    'Menyelesaikan Tugas',
    'Membaca',
    'Menulis',
    'Dikte',
    'Keterampilan'
  ];
}
