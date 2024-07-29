class LearningFlowModel {
    String? id;
    String? userId;
    String? tahap;
    bool? tahapA;
    bool? tahapB;
    bool? tahapC;

    LearningFlowModel({
        this.id,
        this.userId,
        this.tahap,
        this.tahapA,
        this.tahapB,
        this.tahapC,
    });

    factory LearningFlowModel.fromJson(Map<String, dynamic> json) => LearningFlowModel(
        id: json["id"],
        userId: json["user_id"],
        tahap: json["tahap"],
        tahapA: json["tahap_a"],
        tahapB: json["tahap_b"],
        tahapC: json["tahap_c"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "tahap": tahap,
        "tahap_a": tahapA,
        "tahap_b": tahapB,
        "tahap_c": tahapC,
    };
}