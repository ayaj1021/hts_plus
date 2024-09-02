
import 'package:hts_plus/domain/model/auth_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends AuthResponse {
  const LoginResponse({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.token,
    required super.id,
    required super.userType,
    required super.roleName,
    required super.cloudinaryURL,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
