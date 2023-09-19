// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromJson(jsonString);

import 'dart:convert';

LoginDataModel loginDataModelFromJson(String str) => LoginDataModel.fromJson(json.decode(str));

String loginDataModelToJson(LoginDataModel data) => json.encode(data.toJson());

class LoginDataModel {
    bool? success;
    Data? data;

    LoginDataModel({
        this.success,
        this.data,
    });

    factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    String? message;
    dynamic value;

    Data({
        this.message,
        this.value,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "value": value,
    };
}
