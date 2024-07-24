import 'dart:io';

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

  Future<Response> postStoreTaskByAdmin(
    String category,
    String title,
    String description,
    String deadline,
    String shift,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'category': category,
        'title': title,
        'description': description,
        'deadline': deadline,
        'shift': shift,
      });
      final response = _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.storeTaskByAdmin,
        data: formData,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreTaskImageByAdmin(
    String taskId,
    File image,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'tugas_id': taskId,
        'image': await MultipartFile.fromFile(image.path),
      });
      final response = _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.storeTaskImageByAdmin,
        data: formData,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteTaskImageByAdmin(String imageId) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.deleteTaskImageByAdmin}$imageId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteTaskByAdmin(String taskId) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.deleteTaskByAdmin}$taskId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putUpdateStatusTaskByAdmin(
      String taskId, String status) async {
    try {
      final response = _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.updateStatusTaskByAdmin}$taskId',
        data: {'status': status},
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putUpdateTaskByAdmin(
    String taskId,
    String category,
    String title,
    String description,
    String shift,
    String deadline,
  ) async {
    try {
      final data = {
        'category': category,
        'title': title,
        'description': description,
        'shift': shift,
        'deadline': deadline,
      };
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.updateTaskByAdmin}$taskId',
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
