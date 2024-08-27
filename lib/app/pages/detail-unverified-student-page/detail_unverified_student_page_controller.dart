import 'package:fun_education_app_teacher/app/api/user/models/show-current-user-password/show_current_user_model_password.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user-password/show_current_user_response_password.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_response.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailUnverifiedStudentPageController extends GetxController {
  final UnverifiedStudentPageController unverifiedStudentPageController =
      Get.put(UnverifiedStudentPageController());
  RxString userId = ''.obs;
  UserService userService = UserService();
  ShowCurrentUserResponse? showCurrentUserResponse;
  ShowCurrentUserResponsePassword? showCurrentUserResponsePassword;
  Rx<ShowCurrentUserModel> detailInformationUser = ShowCurrentUserModel().obs;
  Rx<ShowCurrentUserModelPassword> informationPasswordUser =
      ShowCurrentUserModelPassword().obs;

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments;
    showByUserId(userId.value);
  }

  Future showByUserId(String userId) async {
    try {
      final response = await userService.getShowByUserId(userId);
      showCurrentUserResponse = ShowCurrentUserResponse.fromJson(response.data);
      detailInformationUser.value = showCurrentUserResponse!.data;
      // await showPasswordUserByAdmin(userId);
      update();
    } catch (e) {
      print(e);
    }
  }

  // Future showPasswordUserByAdmin(String userId) async {
  //   try {
  //     final response = await userService.getShowPasswordByUserId(userId);
  //     showCurrentUserResponsePassword =
  //         ShowCurrentUserResponsePassword.fromJson(response.data);
  //     informationPasswordUser.value = showCurrentUserResponsePassword!.data;
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future updateVerifyUserByAdmin(bool verify) async {
    try {
      await userService.putUpdateVerifyUserByAdmin(userId.value, verify);
      await unverifiedStudentPageController
          .showAllUserByIncomingShiftOne('08.00 - 10.00');
      await unverifiedStudentPageController
          .showAllUserByIncomingShiftTwo('10.00 - 11.30');
      await unverifiedStudentPageController
          .showAllUserByIncomingShiftThree('11.30 - 13.00');
      await unverifiedStudentPageController
          .showAllUserByIncomingShiftFour('13.00 - 14.00');
      await unverifiedStudentPageController
          .showAllUserByIncomingShiftFive('14.00 - 15.00');
      Get.back();
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
