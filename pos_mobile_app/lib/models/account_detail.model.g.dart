// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_detail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDetail _$AccountDetailFromJson(Map<String, dynamic> json) =>
    AccountDetail(
      serviceProviderName: json['serviceProviderName'] as String?,
      accountNo: json['accountNo'] as String?,
      accountName: json['accountName'] as String?,
    );

Map<String, dynamic> _$AccountDetailToJson(AccountDetail instance) =>
    <String, dynamic>{
      'serviceProviderName': instance.serviceProviderName,
      'accountNo': instance.accountNo,
      'accountName': instance.accountName,
    };
