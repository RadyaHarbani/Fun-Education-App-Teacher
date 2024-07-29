import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class SavingSubmissionService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowSavingSubmissionByUserId(String userId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showSavingSubmissionByUserId}$userId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putUpdateStatusSavingSubmission(
    String savingSubmissionId,
    String userId,
    String savingCategory,
    String status,
  ) async {
    try {
      final data = {
        'user_id': userId,
        'category': savingCategory,
        'status': status,
      };
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint:
            '${ApiEndPoint.updateSavingSubmissionByAdmin}$savingSubmissionId',
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
