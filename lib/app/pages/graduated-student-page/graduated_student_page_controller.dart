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
  RxBool isLoadingFetchAllData = false.obs;
  RxBool isLoadingFilterData = false.obs;

  var listGraduatedStudentOne = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentTwo = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentThree = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentFour = <ShowCurrentUserModel>[].obs;
  var listGraduatedStudentFive = <ShowCurrentUserModel>[].obs;
  var allGraduatedStudents = <ShowCurrentUserModel>[].obs;
  var filteredGraduatedStudents = <ShowCurrentUserModel>[].obs;
  // var filteredGraduatedStudentsByShift = <ShowCurrentUserModel>[].obs;

  // var selectedShift = ''.obs;
  var searchQuery = ''.obs;

  // final List<String> shifts = [
  //   '08.00 - 10.00',
  //   '10.00 - 11.30',
  //   '11.30 - 13.00',
  //   '13.00 - 14.00',
  //   '14.00 - 15.00',
  // ];

  @override
  void onInit() {
    super.onInit();
    fetchAllGraduatedStudents();
  }

  Future<void> searchUserGraduate(String query) async {
    try {
      isLoadingFilterData(true);

      // selectedShift.value = '';
      final response = await userService.getSearchUser(
        query,
        'true',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      filteredGraduatedStudents.value =
          showAllUserByIncomingShiftResponse!.data;
      isLoadingFilterData(false);
    } catch (e) {
      isLoadingFilterData(false);
      print("Error fetching students for shift $query: $e");
    }
  }

  Future<void> fetchAllGraduatedStudents() async {
    try {
      isLoadingFetchAllData(true);
      // filteredGraduatedStudentsByShift.clear();
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

      // filterGraduatedStudentsByShift();
      isLoadingFetchAllData(false);
    } catch (e) {
      isLoadingFetchAllData(false);
      print("Error fetching students: $e");
    }
  }

  // void filterGraduatedStudentsByShift() {
  //   searchController.text = '';
  //   searchQuery.value = '';

  //   if (selectedShift.value.isEmpty) {
  //     filteredGraduatedStudentsByShift.value = allGraduatedStudents;
  //   } else {
  //     filteredGraduatedStudentsByShift.value = allGraduatedStudents
  //         .where((student) => student.shift == selectedShift.value)
  //         .toList();
  //   }
  // }

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
