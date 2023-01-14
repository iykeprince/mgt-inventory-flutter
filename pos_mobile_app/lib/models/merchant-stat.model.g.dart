// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant-stat.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantStat _$MerchantStatFromJson(Map<String, dynamic> json) => MerchantStat(
      openingBalance: (json['openingBalance'] as num?)?.toDouble(),
      totalWithdrawals: (json['totalWithdrawals'] as num?)?.toDouble(),
      totalProfit: (json['totalProfit'] as num?)?.toDouble(),
      cashAtHand: (json['cashAtHand'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MerchantStatToJson(MerchantStat instance) =>
    <String, dynamic>{
      'openingBalance': instance.openingBalance,
      'totalWithdrawals': instance.totalWithdrawals,
      'totalProfit': instance.totalProfit,
      'cashAtHand': instance.cashAtHand,
    };
