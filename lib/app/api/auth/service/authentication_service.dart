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

  Future<Response> checkEmailExist(String email) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.checkEmailExist,
        data: {
          'email': email,
          'is_exist': 'true',
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> postSendOtp(String email) async {
    try {
      await _dioInstance.postRequest(
        endpoint: ApiEndPoint.sendOtp,
        data: {
          'email': email,
        },
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postVerifyOtp(String email, String otp) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.verifyOtp,
        data: {
          'email': email,
          'otp': otp,
          'reset_password': true,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putResetPassword(
    String email,
    String tokenResetPassword,
    String password,
  ) async {
    try {
      final response = await _dioInstance.putRequest(
        endpoint: ApiEndPoint.resetPassword,
        data: {
          'email': email,
          'token_reset_password': tokenResetPassword,
          'password': password,
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
