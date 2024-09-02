import 'package:flutter/material.dart';
import 'package:hts_plus/core/utils/strings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@immutable
@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  const BaseResponse({
    required this.status,
    this.data,
    this.message,
    this.errors,
  }) : super();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }

  factory BaseResponse.fromMap(Map<String, dynamic> json) {
    return BaseResponse(
      data: json['data'] as T?,
      status: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? Strings.genericErrorMessage,
      errors: json["errors"]
    );
  }
  final T? data;
  @JsonKey(name: 'success')
  final bool status;
  final String? message;
  final Error? errors;

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);

  @override
  String toString() {
    return '''BaseResponse{status: $status, data: $data, message: $message, errors: $errors }''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseResponse<T> &&
        other.status == status &&
        other.data == data &&
        other.message == message &&
        other.errors == errors;
  }

  @override
  int get hashCode {
    return status.hashCode ^ data.hashCode ^ message.hashCode ^ errors.hashCode;
  }
}


//retrofit - for network request
//json_serializable - for json serialization
//json annotation - for json serialization

class Error {
  bool? success;
  List<ErrorDetail>? error;

  Error({this.success, this.error});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      success: json['success'],
      error: json['error'] != null
          ? List<ErrorDetail>.from(json['error'].map((x) => ErrorDetail.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'error': error != null ? List<dynamic>.from(error!.map((x) => x.toJson())) : null,
    };
  }
}

class ErrorDetail {
  String? password;
  String? email;

  ErrorDetail({this.password, this.email});

  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      password: json['password'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
    };
  }
}
