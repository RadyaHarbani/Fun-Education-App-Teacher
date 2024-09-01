import 'dart:async'; // Tambahkan ini untuk menggunakan Timer
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-all-user-by-incoming-shift/show_all_user_by_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GraduatedStudentPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  UserService userService = UserService();
  ShowAllUserByIncomingShiftResponse? showAllUserByIncomingShiftResponse;
  TextEditingController searchController = TextEditingController();

  var listGraduatedStudentOne = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentTwo = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentThree = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentFour = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentFive = <ShowCurrentUserModel>[].obs;
  var allGraduatedStudents = <ShowCurrentUserModel>[].obs;
  var filteredGraduatedStudents = <ShowCurrentUserModel>[].obs;

  var selectedShift = ''.obs;
  var searchQuery = ''.obs;

  Timer? _debounce; // Tambahkan ini

  final List<String> shifts = [
    '08.00 - 10.00',
    '10.00 - 11.30',
    '11.30 - 13.00',
    '13.00 - 14.00',
    '14.00 - 15.00',
  ];

  @override
  void onInit() {
    super.onInit();
    fetchAllGraduatedStudents();
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchQuery.value = query;
      searchController.text = query;
      if (query.isEmpty) {
        fetchAllGraduatedStudents();
      } else {
        searchUserGraduate(query);
      }
    });
  }

  Future<void> searchUserGraduate(String query) async {
    try {
      selectedShift.value = '';
      final response = await userService.getSearchUser(
        query,
        'true',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      filteredGraduatedStudents.value =
          showAllUserByIncomingShiftResponse!.data;
    } catch (e) {
      print("Error fetching students for shift $query: $e");
    }
  }

  Future<void> fetchAllGraduatedStudents() async {
    filteredGraduatedStudents.clear();
    try {
      await showAllUserByIncomingShiftOne('08.00 - 10.00');
      await showAllUserByIncomingShiftTwo('10.00 - 11.30');
      await showAllUserByIncomingShiftThree('11.30 - 13.00');
      await showAllUserByIncomingShiftFour('13.00 - 14.00');
      await showAllUserByIncomingShiftFive('14.00 - 15.00');

      allGraduatedStudents.clear();
      allGraduatedStudents.addAll(listGraduatedStudentOne);
      allGraduatedStudents.addAll(listGraduatedStudentTwo);
      allGraduatedStudents.addAll(listGraduatedStudentThree);
      allGraduatedStudents.addAll(listGraduatedStudentFour);
      allGraduatedStudents.addAll(listGraduatedStudentFive);

      filterGraduatedStudentsByShift();
    } catch (e) {
      print("Error fetching students: $e");
    }
  }

  void filterGraduatedStudentsByShift() {
    print("Filtering for shift: ${selectedShift.value}");

    searchController.text = '';
    searchQuery.value = '';

    if (selectedShift.value.isEmpty) {
      filteredGraduatedStudents.value = allGraduatedStudents;
    } else {
      filteredGraduatedStudents.value = allGraduatedStudents
          .where((student) => student.shift == selectedShift.value)
          .toList();
    }
  }

  Future<void> showAllUserByIncomingShiftOne(String shift) async {
    try {
      final response = await userService.getShowAllUsersByIncomingShift(
        shift,
        'true',
        'true',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listGraduatedStudentOne.value = showAllUserByIncomingShiftResponse!.data;
    } catch (e) {
      print("Error fetching students for shift $shift: $e");
    }
  }

  Future<void> showAllUserByIncomingShiftTwo(String shift) async {
    try {
      final response = await userService.getShowAllUsersByIncomingShift(
        shift,
        'true',
        'true',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listGraduatedStudentTwo.value = showAllUserByIncomingShiftResponse!.data;
    } catch (e) {
      print("Error fetching students for shift $shift: $e");
    }
  }

  Future<void> showAllUserByIncomingShiftThree(String shift) async {
    try {
      final response = await userService.getShowAllUsersByIncomingShift(
        shift,
        'true',
        'true',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listGraduatedStudentThree.value =
          showAllUserByIncomingShiftResponse!.data;
    } catch (e) {
      print("Error fetching students for shift $shift: $e");
    }
  }

  Future<void> showAllUserByIncomingShiftFour(String shift) async {
    try {
      final response = await userService.getShowAllUsersByIncomingShift(
        shift,
        'true',
        'true',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listGraduatedStudentFour.value = showAllUserByIncomingShiftResponse!.data;
    } catch (e) {
      print("Error fetching students for shift $shift: $e");
    }
  }

  Future<void> showAllUserByIncomingShiftFive(String shift) async {
    try {
      final response = await userService.getShowAllUsersByIncomingShift(
        shift,
        'true',
        'true',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listGraduatedStudentFive.value = showAllUserByIncomingShiftResponse!.data;
    } catch (e) {
      print("Error fetching students for shift $shift: $e");
    }
  }
}
