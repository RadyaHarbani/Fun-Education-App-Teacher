import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class SchoolInformationTitleService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowAllSchoollInformation() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showAllSchoolInformation,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreSchoolInformationTitle (String title) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.postSchoolInformationTitle,
        data: {
          'title': title,
        }
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateSchoolInformationTitle (String title, String schoolInformationId,) async {
    try {
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.updateSchoolInformationTitle}$schoolInformationId',
        data: {
          'title': title,
        }
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteSchoolInformationTitle (String schoolInformationId) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.deleteSchoolInformationTitle}$schoolInformationId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
