import 'package:json_annotation/json_annotation.dart';

part 'transaction.model.g.dart';

@JsonSerializable()
class Transaction {
  Transaction({
    this.accountId,
    this.isDeduction,
    this.isCardWithdrawal,
    this.isTransferWithdrawal,
    this.id,
    this.type,
    this.other,
    this.transactionId,
    this.amount,
    this.serviceCharge,
    this.bankCharge,
    this.serviceChargePaymentType,
    this.merchantId,
    this.branchId,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  String? accountId;
  bool? isDeduction;
  bool? isCardWithdrawal;
  bool? isTransferWithdrawal;
  String? id;
  String? type;
  String? other;
  String? transactionId;
  int? amount;
  int? serviceCharge;
  int? bankCharge;
  String? serviceChargePaymentType;
  String? merchantId;
  String? branchId;
  String? comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
