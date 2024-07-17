// To parse this JSON data, do
//
//     final showByIdAlbumResponse = showByIdAlbumResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';

ShowByIdAlbumResponse showByIdAlbumResponseFromJson(String str) => ShowByIdAlbumResponse.fromJson(json.decode(str));

String showByIdAlbumResponseToJson(ShowByIdAlbumResponse data) => json.encode(data.toJson());

class ShowByIdAlbumResponse {
    ShowAllAlbumsModel data;

    ShowByIdAlbumResponse({
        required this.data,
    });

    factory ShowByIdAlbumResponse.fromJson(Map<String, dynamic> json) => ShowByIdAlbumResponse(
        data: ShowAllAlbumsModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}