import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';
import 'package:intl/intl.dart';

class DailyReportService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowUserDoneUndone(
    String isDone,
    String shift,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndPoint.showUserDoneUndone}',
          isAuthorize: true,
          tokenType: 'teacher',
          queryParameters: {
            'is_done': '$isDone',
            'date': '${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
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

  // Future<Response> postStoreDailyReportByAdmin(
  //   String userId,
  //   String actitivity1,
  //   String actitivity2,
  //   String actitivity3,
  //   String actitivity4,
  //   String actitivity5,
  //   String actitivity6,
  //   String actitivity7,
  //   String actitivity8,
  //   String actitivity9,
  //   String actitivity10,
  //   String note,
  // ) async {
  //   try {
  //     final response = await _dioInstance.postRequest(
  //       isAuthorize: true,
  //       tokenType: 'teacher',
  //       endpoint: ApiEndPoint.storeDailyReportByAdmin,
  //       data: {
  //         'user_id': userId,
  //         'activity1': actitivity1,
  //         'activity2': actitivity2,
  //         'activity3': actitivity3,
  //         'activity4': actitivity4,
  //         'activity5': actitivity5,
  //         'activity6': actitivity6,
  //         'activity7': actitivity7,
  //         'activity8': actitivity8,
  //         'activity9': actitivity9,
  //         'activity10': actitivity10,
  //         'note': note,
  //       },
  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  Future<Response> postStoreDailyReportByAdmin(
  String userId,
  Map<String, String> activities,
  String note,
) async {
  try {
    final response = await _dioInstance.postRequest(
      isAuthorize: true,
      tokenType: 'teacher',
      endpoint: ApiEndPoint.storeDailyReportByAdmin,
      data: {
        'user_id': userId,
        ...activities,
        'note': note,
      },
    );
    return response;
  } catch (e) {
    throw Exception(e);
  }
}
}
