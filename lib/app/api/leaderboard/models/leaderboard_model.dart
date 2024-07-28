class LeaderboardModel {
    String fullName;
    String point;
    bool isUser;
    int rank;

    LeaderboardModel({
        required this.fullName,
        required this.point,
        required this.isUser,
        required this.rank,
    });

    factory LeaderboardModel.fromJson(Map<String, dynamic> json) => LeaderboardModel(
        fullName: json["full_name"],
        point: json["point"],
        isUser: json["is_user"],
        rank: json["rank"],
    );

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "point": point,
        "is_user": isUser,
        "rank": rank,
    };
}