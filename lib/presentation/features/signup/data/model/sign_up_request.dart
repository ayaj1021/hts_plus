import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest extends Equatable {
  const SignUpRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.stateId,
    required this.regionId,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);

  final String? firstName;
  final String? lastName;
  final String? email;

  final String? password;
  final String? stateId;
  final String? regionId;

  //@JsonKey(name: 'first_name')

  // @JsonKey(name: 'last_name')

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  SignUpRequest copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? stateId,
    String? regionId,
  }) {
    return SignUpRequest(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      stateId: stateId ?? this.stateId,
      regionId: regionId ?? this.regionId,
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        stateId,
        regionId,
      ];
}
