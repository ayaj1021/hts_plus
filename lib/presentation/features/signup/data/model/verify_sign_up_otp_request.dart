import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_sign_up_otp_request.g.dart';

@JsonSerializable()
class VerifySignUpOtpRequest extends Equatable {
  const VerifySignUpOtpRequest({
    required this.email,
    required this.confirmationCode,
  });

  factory VerifySignUpOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifySignUpOtpRequestFromJson(json);

  final String? email;

  final String? confirmationCode;

  //@JsonKey(name: 'first_name')

  // @JsonKey(name: 'last_name')

  Map<String, dynamic> toJson() => _$VerifySignUpOtpRequestToJson(this);

  VerifySignUpOtpRequest copyWith({
    String? email,
    String? confirmationCode,
  }) {
    return VerifySignUpOtpRequest(
      email: email ?? this.email,
      confirmationCode: confirmationCode ?? this.confirmationCode,
    );
  }

  @override
  List<Object?> get props => [
        email,
        confirmationCode,
      ];
}
