import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class UserService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowCurrentUserTeacher() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showCurrentUser,
        isAuthorize: true,
        tokenType: 'teacher',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowAllUsersByIncomingShift(String shift) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showAllUserByIncomingShift}',
        queryParameters: {
          'shift': shift,
          'is_verified': 'true',
        },
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByUserId(String userId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByIdUser}$userId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putUpdateUserByAdmin(
    String userId,
    String fullName,
    String nickName,
    String password,
    String birth,
    String address,
    String shift,
    String gender,
  ) async {
    try {
      final data = {
        'full_name': fullName,
        'nickname': nickName,
        'password': password,
        'birth': birth,
        'address': address,
        'shift': shift,
        'gender': gender,
      };
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.updateUserByAdmin}$userId',
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteUserByAdmin(String userId) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.deleteUserByAdmin}$userId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowPasswordByUserId(String userId) async {
    try {
      final response = await _dioInstance.getRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.showPasswordUserByAdmin}$userId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
