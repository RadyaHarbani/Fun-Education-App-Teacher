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
        endpoint: '${ApiEndPoint.showAllUserByIncomingShift}$shift',
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

  // Future<Response> putUpdateUserByAdmin(String userId, Map<String, dynamic> data) async {
  //   try {
  //     final response = await _dioInstance.putRequest(
  //       endpoint: '${ApiEndPoint.updateUserByAdmin}$userId',
  //       data: data,
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future deleteUserByAdmin(String userId) async {
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
}
