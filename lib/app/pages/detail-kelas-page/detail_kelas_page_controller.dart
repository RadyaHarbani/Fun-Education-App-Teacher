import 'package:get/get.dart';

class DetailKelasPageController extends GetxController {
    var selectedOption = ''.obs;
  void selectTime(String option) {
    selectedOption.value = option;
  }

  var selectedOptions = <String>[].obs;

  void selectOption(String value, bool? checked) {
    if (checked == true) {
      selectedOptions.add(value);
    } else {
      selectedOptions.remove(value);
    }
  }

  void submitSelection() {
    // Logic to handle the selected options
    Get.snackbar('Selected Options', selectedOptions.join(', '));
  }
}