class ShowUserModel {
    String? id;
    String? fullName;
    String? nickname;
    String? birth;
    String? address;
    String? shift;
    String? gender;
    String? profilePicture;
    String? role;

    ShowUserModel({
        this.id,
        this.fullName,
        this.nickname,
        this.birth,
        this.address,
        this.shift,
        this.gender,
        this.profilePicture,
        this.role,
    });

    factory ShowUserModel.fromJson(Map<String, dynamic> json) => ShowUserModel(
        id: json["id"],
        fullName: json["full_name"],
        nickname: json["nickname"],
        birth: json["birth"],
        address: json["address"],
        shift: json["shift"],
        gender: json["gender"],
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
        "gender": gender,
        "profile_picture": profilePicture,
        "role": role,
    };
}