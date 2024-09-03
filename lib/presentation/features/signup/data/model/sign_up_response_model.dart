// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) => SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) => json.encode(data.toJson());

class SignUpResponseModel {
    final bool? success;
    final SignUpResponseModelUser? user;
    final String? message;

    SignUpResponseModel({
        this.success,
        this.user,
        this.message,
    });

    factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        success: json["success"],
        user: json["user"] == null ? null : SignUpResponseModelUser.fromJson(json["user"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user?.toJson(),
        "message": message,
    };
}

class SignUpResponseModelUser {
    final UserUser? user;

    SignUpResponseModelUser({
        this.user,
    });

    factory SignUpResponseModelUser.fromJson(Map<String, dynamic> json) => SignUpResponseModelUser(
        user: json["user"] == null ? null : UserUser.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
    };
}

class UserUser {
    final String? userType;
    final bool? isVerified;
    final int? id;
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? roleName;
    final String? password;
    final DateTime? updatedAt;
    final DateTime? createdAt;

    UserUser({
        this.userType,
        this.isVerified,
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.roleName,
        this.password,
        this.updatedAt,
        this.createdAt,
    });

    factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
        userType: json["userType"],
        isVerified: json["isVerified"],
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        roleName: json["roleName"],
        password: json["password"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "userType": userType,
        "isVerified": isVerified,
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "roleName": roleName,
        "password": password,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
    };
}
