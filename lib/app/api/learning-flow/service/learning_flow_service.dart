import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class LearningFlowService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getLearningFlowByUserId(String userId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showLearningFlowByUserId}$userId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> putUpdateLearningFlowByAdmin(
    String learningFlowId,
    String userId,
    String tahap,
  ) async {
    try {
      final response = await _dioInstance.putRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.updateLearningFlowByAdmin}$learningFlowId',
        data: {
          'user_id': userId,
          'tahap': tahap,
        },
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
