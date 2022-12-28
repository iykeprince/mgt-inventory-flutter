// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin-stat.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminStat _$AdminStatFromJson(Map<String, dynamic> json) => AdminStat(
      deposits: (json['deposits'] as num?)?.toDouble(),
      expenses: (json['expenses'] as num?)?.toDouble(),
      serviceCharge: (json['serviceCharge'] as num?)?.toDouble(),
      cardWithdrawal: (json['cardWithdrawal'] as num?)?.toDouble(),
      transferWithdrawal: (json['transferWithdrawal'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
      openingBalance: (json['openingBalance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AdminStatToJson(AdminStat instance) => <String, dynamic>{
      'deposits': instance.deposits,
      'expenses': instance.expenses,
      'serviceCharge': instance.serviceCharge,
      'cardWithdrawal': instance.cardWithdrawal,
      'transferWithdrawal': instance.transferWithdrawal,
      'openingBalance': instance.openingBalance,
      'balance': instance.balance,
    };
