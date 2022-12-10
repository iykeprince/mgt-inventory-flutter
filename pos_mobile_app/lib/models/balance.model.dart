import 'account_detail.model.dart';
import 'branch.model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'balance.model.g.dart';

@JsonSerializable()
class Balance {
  Balance({
    this.accountBalances,
    this.totalBalance,
    this.branch,
  });

  List<AccountBalance>? accountBalances;
  int? totalBalance;
  Branch? branch;

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}

@JsonSerializable()
class AccountBalance {
  AccountBalance({
    this.accountDetail,
    this.id,
    this.adminId,
    this.balance,
    this.accountType,
    this.createdAt,
    this.updatedAt,
    this.branchId,
  });

  AccountDetail? accountDetail;
  String? id;
  String? adminId;
  int? balance;
  String? accountType;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? branchId;

  factory AccountBalance.fromJson(Map<String, dynamic> json) =>
      _$AccountBalanceFromJson(json);
  Map<String, dynamic> toJson() => _$AccountBalanceToJson(this);
}
