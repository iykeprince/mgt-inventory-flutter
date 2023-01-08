// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) =>
    DefaultResponse(
      message: json['message'] as String,
      status: json['status'],
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
    );

Map<String, dynamic> _$DefaultResponseToJson(DefaultResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
