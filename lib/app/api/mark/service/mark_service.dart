import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class MarkService {
  final DioInstance _dioInstance = DioInstance();
  
  Future<Response> getMarkShowByTaskId (String taskId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.markShowByTaskId}$taskId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getMarkShowByUserId (String userId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.markShowByUserId}$userId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}