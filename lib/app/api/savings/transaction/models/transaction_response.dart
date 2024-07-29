// To parse this JSON data, do
//
//     final transactionResponse = transactionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/savings/transaction/models/transaction_model.dart';

TransactionResponse transactionResponseFromJson(String str) => TransactionResponse.fromJson(json.decode(str));

String transactionResponseToJson(TransactionResponse data) => json.encode(data.toJson());

class TransactionResponse {
    String totalIncome;
    String totalOutcome;
    List<TransactionModel> data;

    TransactionResponse({
        required this.totalIncome,
        required this.totalOutcome,
        required this.data,
    });

    factory TransactionResponse.fromJson(Map<String, dynamic> json) => TransactionResponse(
        totalIncome: json["total_income"],
        totalOutcome: json["total_outcome"],
        data: List<TransactionModel>.from(json["data"].map((x) => TransactionModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_income": totalIncome,
        "total_outcome": totalOutcome,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}