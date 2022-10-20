import 'package:json_annotation/json_annotation.dart';

part 'branch.model.g.dart';

@JsonSerializable()
class Branch {
  String? id;
  String? uid;
  String? name;
  String? location;
  int? numberOfMerchants;
  String? kioskName;
  List<String>? accountIds;
  String? adminId;

  Branch({
    this.id,
    this.name,
    this.uid,
    this.location,
    this.numberOfMerchants,
    this.kioskName,
    this.accountIds,
    this.adminId,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
