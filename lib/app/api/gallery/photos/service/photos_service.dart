import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fun_education_app_teacher/app/api/api_endpoint.dart';
import 'package:fun_education_app_teacher/app/api/dio_instance.dart';

class PhotosService {
  final DioInstance _dioInstance = DioInstance();

  Future<Response> getShowAllPhotos() async {
    try {
      final response = await _dioInstance.getRequest(
        endpoint: ApiEndPoint.showAllPhotos,
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> postStorePhotoByAdmin(
    bool isAlbum,
    File image,
    String title,
    String description,
    String? albumId,
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path),
        'title': title,
        'description': description,
        if (isAlbum == true) 'album_id': albumId,
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

  Future<Response> deletePhotoByAdmin(String idPhoto) async {
    try {
      final response = await _dioInstance.deleteRequest(
        isAuthorize: true,
        tokenType: 'teacher',
        endpoint: '${ApiEndPoint.deletePhotoByAdmin}$idPhoto',
      );
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
