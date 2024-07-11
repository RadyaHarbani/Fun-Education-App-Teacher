import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';
class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String nickname, String password) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndPoint.login,
          data: {'nickname': nickname, 'password': password});
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

   Future<Response> logout() async {
    try {
      final response =  await _dioInstance.deleteRequest(
          endpoint: ApiEndPoint.logout,
          isAuthorize: true
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
