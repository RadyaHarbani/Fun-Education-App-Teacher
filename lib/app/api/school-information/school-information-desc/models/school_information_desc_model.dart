class SchoolInformationDescModel {
  String? id;
  String? schoolInformationId;
  String? body;

  SchoolInformationDescModel({
    this.id,
    this.schoolInformationId,
    this.body,
  });

  factory SchoolInformationDescModel.fromJson(Map<String, dynamic> json) => SchoolInformationDescModel(
        id: json["id"],
        schoolInformationId: json["school_information_id"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "school_information_id": schoolInformationId,
        "body": body,
      };
}
