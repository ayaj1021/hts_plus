// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:hts_plus/domain/model/auth_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable(createToJson: false)
class SignUpResponse extends AuthResponse {
  const SignUpResponse({
    required super.token,
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.id,
    required super.userType,
    required super.roleName,
    required super.cloudinaryURL,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class HTSUser extends Equatable {
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String firstName;
  @JsonKey(defaultValue: '')
  final String lastName;

  const HTSUser({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory HTSUser.fromJson(Map<String, dynamic> json) => _$HTSUserFromJson(json);

  Map<String, dynamic> toJson() => _$HTSUserToJson(this);

  @override
  List<Object> get props => [email, firstName, lastName];
}
