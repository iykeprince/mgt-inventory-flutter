// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Expense _$ExpenseFromJson(Map<String, dynamic> json) => Expense(
      accountId: json['accountId'] as String?,
      isDeduction: json['isDeduction'] as bool?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      other: json['other'] as String?,
      date: json['date'] as String?,
      transactionId: json['transactionId'] as String?,
      amount: json['amount'] as int?,
      paymentMethod: json['paymentMethod'] as String?,
      comment: json['comment'] as String?,
      merchantId: json['merchantId'] as String?,
      branchId: json['branchId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ExpenseToJson(Expense instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'isDeduction': instance.isDeduction,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'other': instance.other,
      'date': instance.date,
      'transactionId': instance.transactionId,
      'amount': instance.amount,
      'paymentMethod': instance.paymentMethod,
      'comment': instance.comment,
      'merchantId': instance.merchantId,
      'branchId': instance.branchId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
