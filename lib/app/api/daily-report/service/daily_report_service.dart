import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';
import 'package:intl/intl.dart';

class DailyReportService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowUserDoneUndone(
    String isDone,
    String shift,
    DateTime date,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndPoint.showUserDoneUndone}',
          isAuthorize: true,
          tokenType: 'teacher',
          queryParameters: {
            'is_done': '$isDone',
            'date': '${DateFormat('yyyy-MM-dd').format(date)}',
            'shift': '$shift',
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowDailyReportByUserId(
    String userId,
    String date,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: ApiEndPoint.showDailyReportByUserId,
          isAuthorize: true,
          tokenType: 'teacher',
          queryParameters: {
            'userId': '$userId',
            'date': '$date',
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreDailyReportByAdmin(
    bool isPresent,
    bool isNote,
    String userId,
    Map<String, String>? activities,
    String permission,
    String? note,
    DateTime date,
  ) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.storeDailyReportByAdmin,
        data: {
          'user_id': userId,
          if (isPresent == true) ...activities!,
          if (isNote == true) 'note': note,
          'permission': permission,
          'created_at' : '${DateFormat('yyyy-MM-dd').format(date)}', 
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putUpdateDailyReportByAdmin(
    bool isPresent,
    bool isNote,
    String date,
    String userId,
    Map<String, String>? activities,
    String? note,
    String permission,
  ) async {
    try {
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.updateDailyReportByAdmin,
        queryParameters: {
          'date': date,
        },
        data: {
          'user_id': userId,
          if (isPresent == true) ...activities!,
          'permission': permission,
          if (isNote == true) 'note': note,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteDailyReportByAdmin(
    String date,
    String userId,
  ) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.deleteDailyReportByAdmin,
        queryParameters: {
          'date': date,
          'user_id': userId,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowAvailableDateByUserId(
    String userId,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.showAvailableDateByUserId,
        queryParameters: {
          'user_id': userId,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
