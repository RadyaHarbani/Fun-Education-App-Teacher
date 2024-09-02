import 'package:fun_education_app_teacher/app/api/user/models/show-current-user-password/show_current_user_model_password.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user-password/show_current_user_response_password.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_response.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:get/get.dart';

class DetailGraduatedStudentPageController extends GetxController {
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
      update();
    } catch (e) {
      print(e);
    }
  }

}
