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

  Future<Response> getShowAllUsersByIncomingShift(
    String shift,
    String isVerified,
    String isGraduated,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showAllUserByIncomingShift}',
        queryParameters: {
          'shift': shift,
          'is_verified': isVerified,
          'is_graduated': isGraduated,
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
    bool isPassword,
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
        if (isPassword == true) 'password': password,
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

  // Future<Response> getShowPasswordByUserId(String userId) async {
  //   try {
  //     final response = await _dioInstance.getRequest(
  //       isAuthorize: true,
  //       tokenType: 'teacher',
  //       endpoint: '${ApiEndPoint.showPasswordUserByAdmin}$userId',
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<Response> putUpdateVerifyUserByAdmin(
    String userId,
    bool verify,
  ) async {
    try {
      final response = await _dioInstance.putRequest(
          isAuthorize: true,
          tokenType: 'teacher',
          endpoint: '${ApiEndPoint.updateVerifyUserByAdmin}$userId',
          data: {
            'is_verified': verify,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getSearchUser(
    String search,
    String isVerified,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showAllUserByIncomingShift}',
        queryParameters: {
          'is_verified': isVerified,
          'is_graduated': isVerified,
          'search': search,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
