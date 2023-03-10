import 'package:pos_mobile_app/models/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin.model.g.dart';

@JsonSerializable()
class Admin {
  String? id;
  String? businessName;
  String? businessEmail;
  String? contactPhone;
  String? address;
  int? numOfBranches;
  String? userId;
  String? registeredAt;
  String? imgUrl;
  User? user;

  Admin({
    this.id,
    this.businessName,
    this.businessEmail,
    this.contactPhone,
    this.address,
    this.numOfBranches,
    this.userId,
    this.registeredAt,
    this.imgUrl,
    this.user,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);
}
