import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class LeaderboardService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowLeaderboardByIncomingShift(
    String type,
    String shift,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showLeaderboardByIncomingShift,
        isAuthorize: true,
        tokenType: 'teacher',
        queryParameters: {
          'type': type,
          'shift': shift,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}