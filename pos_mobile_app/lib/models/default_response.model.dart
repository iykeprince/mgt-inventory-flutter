import 'package:json_annotation/json_annotation.dart';

part 'default_response.model.g.dart';

@JsonSerializable()
class DefaultResponse {
  String message;
  dynamic status;
  String? token;

  DefaultResponse({
    required this.message,
    required this.status,
    this.token,
  });

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}
