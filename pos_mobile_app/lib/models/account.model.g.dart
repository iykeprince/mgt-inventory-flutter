// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      accountBalances: (json['accountBalances'] as List<dynamic>?)
          ?.map((e) => AccountBalance.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBalance: json['totalBalance'] as int?,
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountBalances': instance.accountBalances,
      'totalBalance': instance.totalBalance,
      'branch': instance.branch,
    };

AccountBalance _$AccountBalanceFromJson(Map<String, dynamic> json) =>
    AccountBalance(
      accountDetail: json['accountDetail'] == null
          ? null
          : AccountDetail.fromJson(
              json['accountDetail'] as Map<String, dynamic>),
      id: json['id'] as String?,
      adminId: json['adminId'] as String?,
      balance: json['balance'] as int?,
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

Map<String, dynamic> _$AccountBalanceToJson(AccountBalance instance) =>
    <String, dynamic>{
      'accountDetail': instance.accountDetail,
      'id': instance.id,
      'adminId': instance.adminId,
      'balance': instance.balance,
      'accountType': instance.accountType,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'branchId': instance.branchId,
    };

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
