import 'package:json_annotation/json_annotation.dart';

part 'admin-stat.model.g.dart';

@JsonSerializable()
class AdminStat {
  double? deposits;
  double? expenses;
  double? serviceCharge;
  double? cardWithdrawal;
  double? transferWithdrawal;
  double? openingBalance;
  double? balance;

  AdminStat({
    this.deposits,
    this.expenses,
    this.serviceCharge,
    this.cardWithdrawal,
    this.transferWithdrawal,
    this.balance,
    this.openingBalance,
  });

  factory AdminStat.fromJson(Map<String, dynamic> json) =>
      _$AdminStatFromJson(json);
  Map<String, dynamic> toJson() => _$AdminStatToJson(this);
}
