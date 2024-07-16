// import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_model.dart';

class ShowAllPhotosResponse {
  List<ShowAllPhotosModel> data;

  ShowAllPhotosResponse({
    required this.data,
  });

  factory ShowAllPhotosResponse.fromJson(Map<String, dynamic> json) =>
      ShowAllPhotosResponse(
        data: List<ShowAllPhotosModel>.from(
            json["data"].map((x) => ShowAllPhotosModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
