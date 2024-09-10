import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class SchoolInformationDescService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> postStoreSchoolInformationDesc(
    String schoolInformationId,
    String body,
  ) async {
    try {
      final response = await _dioInstance.postRequest(
          isAuthorize: true,
          tokenType: 'teacher',
          endpoint: ApiEndPoint.postSchoolInformationDesc,
          data: {
            'school_information_id': schoolInformationId,
            'body': body,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> updateSchoolInformationDesc(
    String schoolInformationDescId,
    String schoolInformationId,
    String body,
  ) async {
    try {
      final response = await _dioInstance.putRequest(
          isAuthorize: true,
          tokenType: 'teacher',
          endpoint:
              '${ApiEndPoint.updateSchoolInformationDesc}$schoolInformationDescId',
          data: {
            'school_information_id': schoolInformationId,
            'body': body,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteSchoolInformationDesc(
    String schoolInformationDescId,
  ) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint:
            '${ApiEndPoint.deleteSchoolInformationDesc}$schoolInformationDescId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
