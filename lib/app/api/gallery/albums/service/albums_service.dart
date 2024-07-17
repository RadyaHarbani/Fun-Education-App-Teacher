import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class AlbumsService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowAllAlbumPhoto() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showAllAlbums,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreAlbumByAdmin(
    String name,
    String desc,
    String cover,
  ) async {
    try {
      final response = await _dioInstance.postRequest(
        endpoint: ApiEndPoint.storeAlbumByAdmin,
        isAuthorize: true,
        tokenType: 'teacher',
        data: dio.FormData.fromMap({
          'name': name,
          'desc': desc,
          'cover': await dio.MultipartFile.fromFile(cover),
        }),
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStoreAlbumPhotoByAdmin(
    File image,
    String title,
    String description,
    String albumId,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path),
        'title': title,
        'description': description,
        'album_id': albumId,
      });

      final response = await _dioInstance.postRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: ApiEndPoint.storePhotoByAdmin,
        data: formData,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> getShowByIdAlbum(String albumId) async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: '${ApiEndPoint.showByIdAlbum}$albumId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> deleteAlbumByAdmin(String albumId) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.deleteAlbumByAdmin}$albumId',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
