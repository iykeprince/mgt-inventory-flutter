// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_closing_balance.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningClosingBalance _$OpeningClosingBalanceFromJson(
        Map<String, dynamic> json) =>
    OpeningClosingBalance(
      id: json['id'] as String?,
      branchId: json['branchId'] as String?,
      userId: json['userId'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      balanceType: json['balanceType'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OpeningClosingBalanceToJson(
        OpeningClosingBalance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'branchId': instance.branchId,
      'userId': instance.userId,
      'balance': instance.balance,
      'balanceType': instance.balanceType,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
