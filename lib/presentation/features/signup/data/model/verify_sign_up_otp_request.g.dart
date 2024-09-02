// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_sign_up_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifySignUpOtpRequest _$VerifySignUpOtpRequestFromJson(
        Map<String, dynamic> json) =>
    VerifySignUpOtpRequest(
      email: json['email'] as String?,
      confirmationCode: json['confirmationCode'] as String?,
    );

Map<String, dynamic> _$VerifySignUpOtpRequestToJson(
        VerifySignUpOtpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'confirmationCode': instance.confirmationCode,
    };
