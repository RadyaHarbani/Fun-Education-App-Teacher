import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class StatisticService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowStatisticDailyReportByUserId(
    String amount,
    String userId,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.showStatisticDailyReportByUserId}',
        queryParameters: {
          'amount': amount,
          'user_id': userId,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowStatisticTaskByUserId(
    String amount,
    String userId,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.showStatisticTaskByUserId}',
        queryParameters: {
          'amount': amount,
          'user_id': userId,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
