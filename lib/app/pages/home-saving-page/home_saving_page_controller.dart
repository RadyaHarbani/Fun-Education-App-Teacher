import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_model.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_response.dart';
import 'package:fun_education_app_teacher/app/api/incoming-shift/service/incoming_shift_service.dart';
import 'package:get/get.dart';

class HomeSavingPageController extends GetxController {
  IncomingShiftService incomingShiftService = IncomingShiftService();
  ShowAllIncomingShiftResponse? showAllIncomingShiftResponse;
  RxList<ShowAllIncomingShiftModel> showAllIncomingShiftModel =
      <ShowAllIncomingShiftModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showAllIncomingShift();
  }

  Future showAllIncomingShift() async {
    try {
      final response = await incomingShiftService.getShowAllIncomingShift();
      showAllIncomingShiftResponse =
          ShowAllIncomingShiftResponse.fromJson(response.data);
      showAllIncomingShiftModel.value = showAllIncomingShiftResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
