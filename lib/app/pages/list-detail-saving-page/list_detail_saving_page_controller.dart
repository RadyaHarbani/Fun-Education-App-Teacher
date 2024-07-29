import 'package:fun_education_app_teacher/app/api/user/models/show-all-user-by-incoming-shift/show_all_user_by_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:get/get.dart';

class ListDetailSavingPageController extends GetxController {
  UserService userService = UserService();
  ShowAllUserByIncomingShiftResponse? showAllUserByIncomingShiftResponse;
  RxList<ShowCurrentUserModel> showCurrentUserModel =
      <ShowCurrentUserModel>[].obs;
      RxString incomingShift = ''.obs;

  @override
  void onInit() {
    super.onInit();
    incomingShift.value = Get.arguments;
    showAllUserByIncomingShift(incomingShift.value);
  }

  Future showAllUserByIncomingShift(String shift) async {
    try {
      final response = await userService.getShowAllUsersByIncomingShift(shift);
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      showCurrentUserModel.value = showAllUserByIncomingShiftResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
