// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequest _$ResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequest(
      currentPassword: json['currentPassword'] as String?,
      password: json['password'] as String?,
      rePassword: json['rePassword'] as String?,
    );

Map<String, dynamic> _$ResetPasswordRequestToJson(
        ResetPasswordRequest instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'password': instance.password,
      'rePassword': instance.rePassword,
    };
