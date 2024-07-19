class ShowStatusCountModel {
    int? tersedia;
    int? ditutup;
    int? diarsipkan;

    ShowStatusCountModel({
        this.tersedia,
        this.ditutup,
        this.diarsipkan,
    });

    factory ShowStatusCountModel.fromJson(Map<String, dynamic> json) => ShowStatusCountModel(
        tersedia: json["tersedia"],
        ditutup: json["ditutup"],
        diarsipkan: json["diarsipkan"],
    );

    Map<String, dynamic> toJson() => {
        "tersedia": tersedia,
        "ditutup": ditutup,
        "diarsipkan": diarsipkan,
    };
}