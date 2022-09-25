// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) =>
    DefaultResponse(
      message: json['message'] as String,
      status: json['status'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DefaultResponseToJson(DefaultResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'token': instance.token,
    };
