// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      accountDetail: json['accountDetail'] == null
          ? null
          : AccountDetail.fromJson(
              json['accountDetail'] as Map<String, dynamic>),
      id: json['id'] as String?,
      adminId: json['adminId'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      accountType: json['accountType'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      branchId: (json['branchId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountDetail': instance.accountDetail,
      'id': instance.id,
      'adminId': instance.adminId,
      'balance': instance.balance,
      'accountType': instance.accountType,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'branchId': instance.branchId,
    };
