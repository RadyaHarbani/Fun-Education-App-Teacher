import 'package:fun_education_app_teacher/app/api/school-information/school-information-title/models/school_information_response.dart';
import 'package:fun_education_app_teacher/app/api/school-information/school-information-title/models/school_information_title_model.dart';
import 'package:fun_education_app_teacher/app/api/school-information/school-information-title/service/school_information_title_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ManagementSchoolInformationPageController extends GetxController {
  RefreshController refreshController = RefreshController();
  SchoolInformationTitleService schoolInformationTitleService =
      SchoolInformationTitleService();
  SchoolInformationResponse? schoolInformationResponse;
  RxList<SchoolInformationTitleModel> schoolInformationTitleModel =
      <SchoolInformationTitleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    showAllSchoolInformation();
  }

  Future showAllSchoolInformation() async {
    try {
      final response =
          await schoolInformationTitleService.getShowAllSchoollInformation();
      schoolInformationResponse =
          SchoolInformationResponse.fromJson(response.data);
      schoolInformationTitleModel.value = schoolInformationResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
