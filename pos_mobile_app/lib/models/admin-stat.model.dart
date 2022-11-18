import 'package:json_annotation/json_annotation.dart';

part 'admin-stat.model.g.dart';

@JsonSerializable()
class AdminStat {
  double? deposits;
  double? expenses;
  double? serviceCharge;
  double? cardWithdrawal;
  double? transferWithdrawal;

  AdminStat({
    this.deposits,
    this.expenses,
    this.serviceCharge,
    this.cardWithdrawal,
    this.transferWithdrawal,
  });

  factory AdminStat.fromJson(Map<String, dynamic> json) =>
      _$AdminStatFromJson(json);
  Map<String, dynamic> toJson() => _$AdminStatToJson(this);
}
