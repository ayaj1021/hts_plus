import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

// {
//         "tokens": {
//             "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlMzhmZDMzNC04M2FlLTQ3ZTctODIxZS1hNzc4ZmNmOWVjMmEiLCJlbWFpbCI6InRlc3Q1QGVtYWlsLmNvbSIsImZpcnN0TmFtZSI6ImZpcnN0bmFtZSIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJpYXQiOjE3MTg1NzMzMTgsImV4cCI6MTcxODU3MzMxOH0.L7hCpggfnYPBeJ6JcSxPf87ctYSFcLcatlT94eNy3MY",
//             "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlMzhmZDMzNC04M2FlLTQ3ZTctODIxZS1hNzc4ZmNmOWVjMmEiLCJlbWFpbCI6InRlc3Q1QGVtYWlsLmNvbSIsImZpcnN0TmFtZSI6ImZpcnN0bmFtZSIsImxhc3ROYW1lIjoibGFzdG5hbWUiLCJpYXQiOjE3MTg1NzMzMTgsImV4cCI6MTcxODU3MzMxOH0.Dmkbuq6WoLddSWKhZbH6JK0jU6geZ570tWhPHL3seyo"
//         },
//         "email": "test5@email.com",
//         "first_name": "firstname",
//         "last_name": "lastname"
//     }

abstract class AuthResponse extends Equatable {
  const AuthResponse({
    required this.token,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.id,
    required this.userType,
    required this.roleName,
    required this.cloudinaryURL,
  });

  AuthResponse.fromJson(Map<String, dynamic> json)
      : token = Tokens.fromJson(json['token'] as Map<String, dynamic>? ?? {}),
        email = json['email'] as String? ?? '',
        firstName = json['first_name'] as String? ?? '',
        lastName = json['last_name'] as String? ?? '',
        id = json['id'] as String? ?? '',
        userType = json['user_type'] as String? ?? '',
        roleName = json['role_name'] as String? ?? '',
        cloudinaryURL = json['cloudinary_url'] as String? ?? '';

  final Tokens? token;
  final String? email;

  final String? firstName;

  final String? lastName;
  final String? id;
  final String? userType;
  final String? roleName;
  final String? cloudinaryURL;

  @override
  List<Object?> get props => [
        token,
        email,
        firstName,
        lastName,
        id,
        userType,
        roleName,
        cloudinaryURL,
      ];
}

@JsonSerializable()
class Tokens extends Equatable {
  const Tokens({
    required this.token,
 //   required this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

  @JsonKey(name: 'token')
  final String? token;

  // @JsonKey(name: 'refresh_token')
  // final String? refreshToken;

  Map<String, dynamic> toJson() => _$TokensToJson(this);

  @override
  List<Object?> get props => [
        token,
       // refreshToken,
      ];
}

  //       "roleName": null,
  //       "cloudinaryURL": null,
 