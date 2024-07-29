import 'package:fun_education_app_teacher/app/api/savings/total-savings/models/total_savings_model.dart';
import 'package:fun_education_app_teacher/app/api/savings/total-savings/models/total_savings_response.dart';
import 'package:fun_education_app_teacher/app/api/savings/total-savings/service/total_savings_service.dart';
import 'package:get/get.dart';

class DetailSavingPageController extends GetxController {
  TotalSavingsService totalSavingsService = TotalSavingsService();
  TotalSavingsResponse? totalSavingsResponse;
  Rx<TotalSavingsModel> totalSavingsModel = TotalSavingsModel().obs;
  RxString userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userId.value = Get.arguments;
    showTotalSavingsByUserId(userId.value);
  }

  Future showTotalSavingsByUserId(String userId) async {
    try {
      final response = await totalSavingsService.getShowSavingsByUserId(userId);
      totalSavingsResponse = TotalSavingsResponse.fromJson(response.data);
      totalSavingsModel.value = totalSavingsResponse!.data;
    } catch (e) {
      throw Exception(e);
    }
  }
}
