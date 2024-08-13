class ShowCurrentUserModelPassword {
  String? id;
  String? fullName;
  String? nickname;
  String? password;
  String? birth;
  String? address;
  dynamic shift;
  String? gender;
  String? profilePicture;
  String? role;

  ShowCurrentUserModelPassword({
    this.id,
    this.fullName,
    this.nickname,
    this.password,
    this.birth,
    this.address,
    this.shift,
    this.gender,
    this.profilePicture,
    this.role,
  });

  factory ShowCurrentUserModelPassword.fromJson(Map<String, dynamic> json) =>
      ShowCurrentUserModelPassword(
        id: json["id"],
        fullName: json["full_name"],
        nickname: json["nickname"],
        password: json["password"],
        birth: json["birth"],
        address: json["address"],
        shift: json["shift"],
        gender: json['gender'],
        profilePicture: json["profile_picture"],
        role: json["role"],
        
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "nickname": nickname,
        "password": password,
        "birth": birth,
        "address": address,
        "shift": shift,
        "gender": gender,
        "profile_picture": profilePicture,
        "role": role,
        
      };
}
