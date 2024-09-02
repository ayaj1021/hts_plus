import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable(createFactory: false)
class ResetPasswordRequest implements EquatableMixin {
  const ResetPasswordRequest({
    required this.code,
    required this.password,
    required this.confirmPassword,
  });

  final String code;
  final String password;
  final String confirmPassword;

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  List<Object> get props => [code, password, confirmPassword];

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  bool? get stringify => true;
}
