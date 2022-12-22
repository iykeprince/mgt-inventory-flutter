import 'package:json_annotation/json_annotation.dart';

part 'expense.model.g.dart';

@JsonSerializable()
class Expense {
  String? accountId;
  bool? isDeduction;
  String? id;
  String? name;
  String? type;
  String? other;
  String? date;
  String? transactionId;
  int? amount;
  String? paymentMethod;
  String? comment;
  String? merchantId;
  String? branchId;
  String? createdAt;
  String? updatedAt;

  Expense({
    this.accountId,
    this.isDeduction,
    this.id,
    this.name,
    this.type,
    this.other,
    this.date,
    this.transactionId,
    this.amount,
    this.paymentMethod,
    this.comment,
    this.merchantId,
    this.branchId,
    this.createdAt,
    this.updatedAt,
  });

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
  Map<String, dynamic> toJson() => _$ExpenseToJson(this);
}
