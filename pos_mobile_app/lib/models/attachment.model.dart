import 'package:json_annotation/json_annotation.dart';

part 'attachment.model.g.dart';

@JsonSerializable()
class Attachment {
  String? url;
  String? message;

  Attachment({
    this.url,
    this.message,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}
