class ShowGradeModel {
    String id;
    String activity;
    String grade;

    ShowGradeModel({
        required this.id,
        required this.activity,
        required this.grade,
    });

    factory ShowGradeModel.fromJson(Map<String, dynamic> json) => ShowGradeModel(
        id: json["id"],
        activity: json["activity"],
        grade: json["grade"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "activity": activity,
        "grade": grade,
    };
}