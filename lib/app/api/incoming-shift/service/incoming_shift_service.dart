import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class IncomingShiftService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowAllIncomingShift() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showAllIncomingShift,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByIdIncomingShift(String id) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByIdIncomingShift}$id',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreIncomingShiftByAdmin(
    String id,
    String shiftTime,
  ) async {
    try {
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.storeIncomingShiftByAdmin,
        data: {
          'user_id': id,
          'shift_masuk': shiftTime,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
