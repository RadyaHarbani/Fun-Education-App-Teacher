import 'dart:convert';
import 'package:fun_education_app_teacher/app/api/gallery/albums/models/show-all-albums/show_all_albums_model.dart';

ShowAllAlbumsResponse showAllAlbumPhotoResponseFromJson(String str) =>
    ShowAllAlbumsResponse.fromJson(json.decode(str));

String showAllAlbumPhotoResponseToJson(ShowAllAlbumsResponse data) =>
    json.encode(data.toJson());

class ShowAllAlbumsResponse {
  List<ShowAllAlbumsModel> data;

  ShowAllAlbumsResponse({
    required this.data,
  });

  factory ShowAllAlbumsResponse.fromJson(Map<String, dynamic> json) =>
      ShowAllAlbumsResponse(
          data: List<ShowAllAlbumsModel>.from(
              json["data"].map((x) => ShowAllAlbumsModel.fromJson(x))));

  Map<String, dynamic> toJson() =>
      {"data": List<dynamic>.from(data.map((x) => x.toJson()))};
}
