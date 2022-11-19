// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      accountId: json['accountId'] as String?,
      isDeduction: json['isDeduction'] as bool?,
      isCardWithdrawal: json['isCardWithdrawal'] as bool?,
      isTransferWithdrawal: json['isTransferWithdrawal'] as bool?,
      id: json['id'] as String?,
      type: json['type'] as String?,
      other: json['other'] as String?,
      transactionId: json['transactionId'] as String?,
      amount: json['amount'] as int?,
      serviceCharge: json['serviceCharge'] as int?,
      bankCharge: json['bankCharge'] as int?,
      serviceChargePaymentType: json['serviceChargePaymentType'] as String?,
      merchantId: json['merchantId'] as String?,
      branchId: json['branchId'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'isDeduction': instance.isDeduction,
      'isCardWithdrawal': instance.isCardWithdrawal,
      'isTransferWithdrawal': instance.isTransferWithdrawal,
      'id': instance.id,
      'type': instance.type,
      'other': instance.other,
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'serviceCharge': instance.serviceCharge,
      'bankCharge': instance.bankCharge,
      'serviceChargePaymentType': instance.serviceChargePaymentType,
      'merchantId': instance.merchantId,
      'branchId': instance.branchId,
      'comment': instance.comment,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
