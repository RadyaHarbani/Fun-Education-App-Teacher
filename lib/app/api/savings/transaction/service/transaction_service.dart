import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class TransactionService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowTransactionByUserId(String userId) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndPoint.showTransactionByUserId}$userId',
          queryParameters: {
            'limit': 3,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowAvailableMonthsByUserId(
    String userId,
    String year,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        queryParameters: {
          'user_id': userId,
          'year': year,
        },
        endpoint: ApiEndPoint.showTransactionByUserIdAvailableMonth,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowAvailableYearsByUserId(String userId) async {
    try {
      final response = await _dioInstance.getRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        queryParameters: {
          'user_id': userId,
        },
        endpoint: ApiEndPoint.showTransactionByUserIdAvailableYear,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowTransactionByUserIdAndMonthAndYear(
    String userId,
    String month,
    String year,
  ) async {
    try {
      final response = await _dioInstance.getRequest(
          endpoint: '${ApiEndPoint.showTransactionByUserId}$userId',
          queryParameters: {
            'month': month,
            'year': year,
          });
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreTrasactionByAdmin(
    bool isDescription,
    String userId,
    String amount,
    String category,
    String? description,
  ) async {
    try {
      final data = {
        'user_id': userId,
        'amount': amount,
        'category': category,
        if (isDescription == true) 'desc': description,
      };
      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.storeTransactionByAdmin,
        data: data,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
