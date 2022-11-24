import 'package:pos_mobile_app/models/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'branch.model.dart';

part 'merchant.model.g.dart';

@JsonSerializable()
class Merchant {
  String? id;
  String? name;
  String? username;
  String? contactPhone;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? branchId;
  String? adminId;
  String? imgUrl;
  User? user;
  Branch? branch;

  Merchant({
    this.id,
    this.name,
    this.username,
    this.contactPhone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.branchId,
    this.adminId,
    this.user,
    this.branch,
  });

  factory Merchant.fromJson(Map<String, dynamic> json) =>
      _$MerchantFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantToJson(this);
}
