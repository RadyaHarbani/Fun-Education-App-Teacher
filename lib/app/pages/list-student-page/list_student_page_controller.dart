import 'package:fun_education_app_teacher/app/api/user/models/show-all-user-by-incoming-shift/show_all_user_by_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';
import 'package:fun_education_app_teacher/app/api/user/service/user_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListStudentPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  UserService userService = UserService();
  ShowAllUserByIncomingShiftResponse? showAllUserByIncomingShiftResponse;
  RxList<ShowCurrentUserModel> showCurrentUserModel =
      <ShowCurrentUserModel>[].obs;
  RxBool isLoadingListStudent = false.obs;

  @override
  void onInit() {
    super.onInit();
    showAllUserByIncomingShift(Get.arguments);
  }

  Future showAllUserByIncomingShift(String shift) async {
    try {
      isLoadingListStudent(true);
      final response = await userService.getShowAllUsersByIncomingShift(
        shift,
        'true',
        'false',
      );
      showAllUserByIncomingShiftResponse =
          ShowAllUserByIncomingShiftResponse.fromJson(response.data);
      showCurrentUserModel.value = showAllUserByIncomingShiftResponse!.data;
      isLoadingListStudent(false);
      update();
    } catch (e) {
      isLoadingListStudent(false);
      print(e);
    }
  }
}
