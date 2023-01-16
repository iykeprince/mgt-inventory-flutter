import 'package:json_annotation/json_annotation.dart';

part 'merchant-report-stat.model.g.dart';

@JsonSerializable()
class MerchantReportStat {
  double? deposits;
  double? expenses;
  double? serviceCharge;
  double? cardWithdrawal;
  double? transferWithdrawal;
  double? openingBalance;
  double? balance;

  MerchantReportStat({
    this.deposits,
    this.expenses,
    this.serviceCharge,
    this.cardWithdrawal,
    this.transferWithdrawal,
    this.balance,
    this.openingBalance,
  });

  factory MerchantReportStat.fromJson(Map<String, dynamic> json) =>
      _$MerchantReportStatFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantReportStatToJson(this);
}
