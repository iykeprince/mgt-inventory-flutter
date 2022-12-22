import 'package:json_annotation/json_annotation.dart';

import 'branch.model.dart';

part 'opening_closing_balance.model.g.dart';

@JsonSerializable()
class OpeningClosingBalance {
  String? id;
  String? branchId;
  String? userId;
  double? balance;
  String? balanceType;
  String? createdAt;
  String? updatedAt;

  OpeningClosingBalance({
    this.id,
    this.branchId,
    this.userId,
    this.balance,
    this.balanceType,
    this.createdAt,
    this.updatedAt,
  });

  factory OpeningClosingBalance.fromJson(Map<String, dynamic> json) =>
      _$OpeningClosingBalanceFromJson(json);
  Map<String, dynamic> toJson() => _$OpeningClosingBalanceToJson(this);
}
