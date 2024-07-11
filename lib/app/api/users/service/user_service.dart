import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class UserService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentUser() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentUser,
        isAuthorize: true
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}