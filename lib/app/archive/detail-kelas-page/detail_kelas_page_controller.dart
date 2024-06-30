import 'package:get/get.dart';

class DetailKelasPageController extends GetxController {
    var selectedOption = ''.obs;

  void selectTime(String option) {
    selectedOption.value = option;
  }
}