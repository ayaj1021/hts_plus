// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_sign_up_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifySignUpOtpResponse _$VerifySignUpOtpResponseFromJson(
        Map<String, dynamic> json) =>
    VerifySignUpOtpResponse(
      token: json['token'] == null
          ? null
          : Tokens.fromJson(json['token'] as Map<String, dynamic>),
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      id: json['id'] as String?,
      userType: json['userType'] as String?,
      roleName: json['roleName'] as String?,
      cloudinaryURL: json['cloudinaryURL'] as String?,
    );

HTSUser _$HTSUserFromJson(Map<String, dynamic> json) => HTSUser(
      email: json['email'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
    );

Map<String, dynamic> _$HTSUserToJson(HTSUser instance) => <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
