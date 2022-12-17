import 'package:json_annotation/json_annotation.dart';

part 'support.model.g.dart';

@JsonSerializable()
class Support {
  String? status;
  String? title;
  String? category;
  String? attachment;
  String? id;
  String? fullname;
  String? email;
  String? message;
  String? createdAt;
  String? updatedAt;

  Support({
    this.status,
    this.title,
    this.category,
    this.attachment,
    this.id,
    this.fullname,
    this.email,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
