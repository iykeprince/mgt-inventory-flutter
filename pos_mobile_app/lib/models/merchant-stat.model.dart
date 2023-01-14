import 'package:json_annotation/json_annotation.dart';

part 'merchant-stat.model.g.dart';

@JsonSerializable()
class MerchantStat {
  double? openingBalance;
  double? totalWithdrawals;
  double? totalProfit;
  double? cashAtHand;

  MerchantStat({
    this.openingBalance,
    this.totalWithdrawals,
    this.totalProfit,
    this.cashAtHand,
  });

  factory MerchantStat.fromJson(Map<String, dynamic> json) =>
      _$MerchantStatFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantStatToJson(this);
}
