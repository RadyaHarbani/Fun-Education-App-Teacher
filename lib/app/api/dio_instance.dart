import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInstance {
  late Dio _dio;

  DioInstance() {
    _dio = Dio(BaseOptions(
      baseUrl: ApiEndPoint.baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Response> getRequest({
    required String endpoint,
    bool? isAuthorize,
    String? tokenType,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final teachersToken = prefs.getString('teachersToken');
    final studentsToken = prefs.getString('studentsToken');
    final token = tokenType == 'teacher' ? teachersToken : studentsToken;

    try {
      response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token",
          },
        ),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  Future<Response> postRequest({
    required String endpoint,
    bool? isAuthorize,
    String? tokenType,
    required Object data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final teachersToken = prefs.getString('teachersToken');
    final studentsToken = prefs.getString('studentsToken');
    final token = tokenType == 'teacher' ? teachersToken : studentsToken;

    try {
      response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token",
          },
        ),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> putRequest({
    required String endpoint,
    bool? isAuthorize,
    String? tokenType,
    required Object data,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final teachersToken = prefs.getString('teachersToken');
    final studentsToken = prefs.getString('studentsToken');
    final token = tokenType == 'teacher' ? teachersToken : studentsToken;

    try {
      response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token",
          },
        ),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  Future<Response> deleteRequest({
    required String endpoint,
    bool? isAuthorize,
    String? tokenType,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response response;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final teachersToken = prefs.getString('teachersToken');
    final studentsToken = prefs.getString('studentsToken');
    final token = tokenType == 'teacher' ? teachersToken : studentsToken;

    try {
      response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Accept": "application/json",
            if (isAuthorize ?? false) "Authorization": "Bearer $token",
          },
        ),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          return handler.next(error);
        },
        onRequest: (request, handler) {
          print(request.method + " " + request.path);
          print(request.data);
          return handler.next(request);
        },
        onResponse: (response, handler) {
          print(response.data);
          return handler.next(response);
        },
      ),
    );
  }
}
