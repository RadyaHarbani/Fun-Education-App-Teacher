class ShowUserDoneUndoneModel {
    String? id;
    String? profilePicture;
    String? fullName;
    String? permission;

    ShowUserDoneUndoneModel({
        this.id,
        this.profilePicture,
        this.fullName,
        this.permission,
    });

    factory ShowUserDoneUndoneModel.fromJson(Map<String, dynamic> json) => ShowUserDoneUndoneModel(
        id: json["id"],
        profilePicture: json["profile_picture"],
        fullName: json["full_name"],
        permission: json["permission"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "profile_picture": profilePicture,
        "full_name": fullName,
        "permission": permission,
    };
}