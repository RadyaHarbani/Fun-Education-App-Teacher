import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class TaskService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowStatusCount(String shift) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showStatusCount}$shift',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByNewStatus(String shift) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByStatus}?shift=$shift&status=Tersedia',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByCloseStatus(String shift) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByStatus}?shift=$shift&status=Ditutup',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByArchiveStatus(String shift) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByStatus}?shift=$shift&status=Diarsipkan',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByTaskId(String taskId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByTaskId}$taskId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }  

  // Future<Response> postStoreTaskByAdmin ( String ){
  //   try {
  //     final response = _dioInstance.postRequest(
  //       endpoint: ApiEndPoint.storeTaskByAdmin,

  //     );
  //     return response;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
