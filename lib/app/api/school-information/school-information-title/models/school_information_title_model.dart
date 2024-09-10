import 'package:fun_education_app_teacher/app/api/school-information/school-information-desc/models/school_information_desc_model.dart';

class SchoolInformationTitleModel {
    String? id;
    String? title;
    List<SchoolInformationDescModel>? description;

    SchoolInformationTitleModel({
        this.id,
        this.title,
        this.description,
    });

    factory SchoolInformationTitleModel.fromJson(Map<String, dynamic> json) => SchoolInformationTitleModel(
        id: json["id"],
        title: json["title"],
        description: List<SchoolInformationDescModel>.from(json["description"].map((x) => SchoolInformationDescModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": List<dynamic>.from(description!.map((x) => x.toJson())),
    };
}