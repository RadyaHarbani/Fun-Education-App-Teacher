import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddReportPageController extends GetxController {
  TextEditingController teachersNote = TextEditingController();
  List<String> pointType = ['A', 'B', 'C'];
  List<RxString> points = List.generate(10, (_) => 'A'.obs);
  var selectedStudent = <String>[].obs;
  var student = [
    {"name": "Parent", "avatar": "https://i.pravatar.cc/50?u=1"},
    {"name": "Guardian", "avatar": "https://i.pravatar.cc/50?u=2"},
    {"name": "Headmaster", "avatar": "https://i.pravatar.cc/50?u=3"},
    {"name": "Teacher", "avatar": "https://i.pravatar.cc/50?u=4"},
    {"name": "Teacher", "avatar": "https://i.pravatar.cc/50?u=4"},
  ].obs;
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

  int calculateTotalPoints() {
    int totalPoints = 0;
    for (var point in points) {
      switch (point.value) {
        case 'A':
          totalPoints += 10;
          break;
        case 'B':
          totalPoints += 6;
          break;
        case 'C':
          totalPoints += 4;
          break;
      }
    }
    return totalPoints;
  }

  void toggleRecipient(String recipientName) {
    if (selectedStudent.contains(recipientName)) {
      selectedStudent.remove(recipientName);
    } else {
      selectedStudent.add(recipientName);
    }
  }

  Future<void> sendReport() async {
    final url = Uri.parse('https://your-api-endpoint.com/report');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer your_token_here',
    };

    final body = {
      'points': points.map((point) => point.value).toList(),
      'totalPoints': calculateTotalPoints(),
      'pointDetails': List.generate(
          pointNames.length,
          (index) => {
                'name': pointNames[index],
                'type': points[index].value,
              }),
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        // Handle success response
        Get.snackbar('Success', 'Report sent successfully');
      } else {
        // Handle error response
        Get.snackbar('Error', 'Failed to send report');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }
  // void printPoints() {
  //   for (int i = 0; i < controller.pointNames.length; i++) {
  //     String pointName = controller.pointNames[i];
  //     String pointType = controller.points[i].value;
  //     print('Point Name: $pointName, Point Type: $pointType');
  //   }
  // }
}
