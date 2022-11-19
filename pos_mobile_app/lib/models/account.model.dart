import 'branch.model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'account.model.g.dart';

@JsonSerializable()
class Account {
  Account({
    this.accountBalances,
    this.totalBalance,
    this.branch,
  });

  List<AccountBalance>? accountBalances;
  int? totalBalance;
  Branch? branch;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
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

@JsonSerializable()
class AccountDetail {
  AccountDetail({
    this.serviceProviderName,
    this.accountNo,
    this.accountName,
  });

  String? serviceProviderName;
  String? accountNo;
  String? accountName;

  factory AccountDetail.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailFromJson(json);
  Map<String, dynamic> toJson() => _$AccountDetailToJson(this);
}
