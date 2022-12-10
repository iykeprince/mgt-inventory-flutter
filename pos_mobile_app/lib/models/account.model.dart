import 'package:json_annotation/json_annotation.dart';

import 'account_detail.model.dart';

part 'account.model.g.dart';

@JsonSerializable()
class Account {
  AccountDetail? accountDetail;
  String? id;
  String? adminId;
  double? balance;
  String? accountType;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? branchId;

  Account({
    this.accountDetail,
    this.id,
    this.adminId,
    this.balance,
    this.accountType,
    this.createdAt,
    this.updatedAt,
    this.branchId,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
