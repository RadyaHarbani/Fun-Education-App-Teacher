import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class EmergencyNoteService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowLatestCatatanDarurat() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showLatestCatatanDarurat,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreEmergencyNoteByAdmin(String emergencyNote) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.storeEmergencyNoteByAdmin,
        data: {
          'catatan': emergencyNote,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putUpdateEmergencyNoteByAdmin(
      String emergencyNote, String id) async {
    try {
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.updateEmergencyNoteByAdmin}$id',
        data: {
          'catatan': emergencyNote,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteEmergencyNoteByAdmin(String id) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.deleteEmergencyNoteByAdmin}$id',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
