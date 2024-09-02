// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      token: json['token'] == null
          ? null
          : Tokens.fromJson(json['token'] as Map<String, dynamic>),
      id: json['id'] as String?,
      userType: json['userType'] as String?,
      roleName: json['roleName'] as String?,
      cloudinaryURL: json['cloudinaryURL'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'id': instance.id,
      'userType': instance.userType,
      'roleName': instance.roleName,
      'cloudinaryURL': instance.cloudinaryURL,
    };
