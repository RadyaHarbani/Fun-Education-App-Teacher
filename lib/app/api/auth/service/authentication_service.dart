import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> login(String nickname, String password) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var fcmToken = prefs.getString('tokenFirebase');
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.login,
        data: {
          'email': nickname,
          'password': password,
          'fcm_token': fcmToken,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> logout() async {
    try {
      final response = await _dioInstance.deleteRequest(
        endpoint: ApiEndPoint.logout,
        isAuthorize: true,
        tokenType: 'teacher',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
