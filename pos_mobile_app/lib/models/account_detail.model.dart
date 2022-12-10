import 'package:json_annotation/json_annotation.dart';

part 'account_detail.model.g.dart';

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
