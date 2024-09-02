// To parse this JSON data, do
//
//     final appResponseModel = appResponseModelFromJson(jsonString);

import 'dart:convert';

AppResponseModel appResponseModelFromJson(String str) => AppResponseModel.fromJson(json.decode(str));

String appResponseModelToJson(AppResponseModel data) => json.encode(data.toJson());

class AppResponseModel <T>{
    final bool? success;
    final String? message;
    final List<Error> error;

    AppResponseModel({
        this.success,
        this.message,
      required  this.error,
    });

    factory AppResponseModel.fromJson(Map<String, dynamic> json) => AppResponseModel(
        success: json["success"],
        message: json["message"],
        error: json["error"] == null ? [] : List<Error>.from(json["error"]!.map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error == null ? [] : List<dynamic>.from(error.map((x) => x.toJson())),
    };
}

class Error {
    final String? email;
    final String? message;

    Error({
        this.email,
        this.message,
    });

    factory Error.fromJson(Map<String, dynamic> json) => Error(
        email: json["email"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "message": message,
    };
}
