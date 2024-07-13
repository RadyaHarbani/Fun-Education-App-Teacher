class ShowCurrentUserModel {
    String? id;
    String? fullName;
    String? nickname;
    String? birth;
    String? address;
    dynamic shift;
    String? profilePicture;
    String? role;

    ShowCurrentUserModel({
        this.id,
        this.fullName,
        this.nickname,
        this.birth,
        this.address,
        this.shift,
        this.profilePicture,
        this.role,
    });

    factory ShowCurrentUserModel.fromJson(Map<String, dynamic> json) => ShowCurrentUserModel(
        id: json["id"],
        fullName: json["full_name"],
        nickname: json["nickname"],
        birth: json["birth"],
        address: json["address"],
        shift: json["shift"],
        profilePicture: json["profile_picture"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "nickname": nickname,
        "birth": birth,
        "address": address,
        "shift": shift,
        "profile_picture": profilePicture,
        "role": role,
    };
}
