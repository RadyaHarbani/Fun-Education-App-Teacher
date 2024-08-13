import 'package:fun_education_app_teacher/app/api/user/models/show-all-user-by-incoming-shift/show_all_user_by_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UnverifiedStudentPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  UserService userService = UserService();
  ShowAllUserByIncomingShiftResponse? showAllUserByIncomingShiftResponse;
  RxList<ShowCurrentUserModel> listUnverifiedStudentOne =
      <ShowCurrentUserModel>[].obs;
  RxList<ShowCurrentUserModel> listUnverifiedStudentTwo =
      <ShowCurrentUserModel>[].obs;
  RxList<ShowCurrentUserModel> listUnverifiedStudentThree =
      <ShowCurrentUserModel>[].obs;
  RxList<ShowCurrentUserModel> listUnverifiedStudentFour =
      <ShowCurrentUserModel>[].obs;
  RxList<ShowCurrentUserModel> listUnverifiedStudentFive =
      <ShowCurrentUserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showAllUserByIncomingShiftOne('08.00 - 10.00');
    showAllUserByIncomingShiftTwo('10.00 - 11.30');
    showAllUserByIncomingShiftThree('11.30 - 13.00');
    showAllUserByIncomingShiftFour('13.00 - 14.00');
    showAllUserByIncomingShiftFive('14.00 - 15.00');
  }

  Future showAllUserByIncomingShiftOne(String shift) async {
    try {
      final response =
          await userService.getShowAllUsersByIncomingShift(shift, 'false');
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listUnverifiedStudentOne.value = showAllUserByIncomingShiftResponse!.data;

      update();
    } catch (e) {
      print(e);
    }
  }

  Future showAllUserByIncomingShiftTwo(String shift) async {
    try {
      final response =
          await userService.getShowAllUsersByIncomingShift(shift, 'false');
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listUnverifiedStudentTwo.value = showAllUserByIncomingShiftResponse!.data;

      update();
    } catch (e) {
      print(e);
    }
  }

  Future showAllUserByIncomingShiftThree(String shift) async {
    try {
      final response =
          await userService.getShowAllUsersByIncomingShift(shift, 'false');
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listUnverifiedStudentThree.value =
          showAllUserByIncomingShiftResponse!.data;

      update();
    } catch (e) {
      print(e);
    }
  }

  Future showAllUserByIncomingShiftFour(String shift) async {
    try {
      final response =
          await userService.getShowAllUsersByIncomingShift(shift, 'false');
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listUnverifiedStudentFour.value =
          showAllUserByIncomingShiftResponse!.data;

      update();
    } catch (e) {
      print(e);
    }
  }

  Future showAllUserByIncomingShiftFive(String shift) async {
    try {
      final response =
          await userService.getShowAllUsersByIncomingShift(shift, 'false');
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      listUnverifiedStudentFive.value =
          showAllUserByIncomingShiftResponse!.data;

      update();
    } catch (e) {
      print(e);
    }
  }

  Future updateVerifyUserByAdmin(String userId, bool verify) async {
    try {
      await userService.putUpdateVerifyUserByAdmin(userId, verify);
      await showAllUserByIncomingShiftOne('08.00 - 10.00');
      await showAllUserByIncomingShiftTwo('10.00 - 11.30');
      await showAllUserByIncomingShiftThree('11.30 - 13.00');
      await showAllUserByIncomingShiftFour('13.00 - 14.00');
      await showAllUserByIncomingShiftFive('14.00 - 15.00');
      update();
      if (verify == true) {
        Get.snackbar(
          'Berhasil',
          'Siswa Berhasil Didaftarkan',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
      } else {
        Get.snackbar(
          'Berhasil',
          'Siswa Berhasil Ditolak',
          backgroundColor: successColor,
          colorText: whiteColor,
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        'Gagal',
        'Siswa Gagal Didaftarkan',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
