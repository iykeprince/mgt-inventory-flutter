// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
      status: json['status'] as String?,
      title: json['title'] as String?,
      category: json['category'] as String?,
      attachment: json['attachment'] as String?,
      id: json['id'] as String?,
      fullname: json['fullname'] as String?,
      email: json['email'] as String?,
      message: json['message'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'status': instance.status,
      'title': instance.title,
      'category': instance.category,
      'attachment': instance.attachment,
      'id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'message': instance.message,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
