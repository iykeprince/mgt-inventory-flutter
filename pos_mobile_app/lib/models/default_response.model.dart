import 'package:json_annotation/json_annotation.dart';

part 'default_response.model.g.dart';

@JsonSerializable()
class DefaultResponse {
  String message;
  dynamic status;
  @JsonKey(name: "access_token")
  String? accessToken;
  @JsonKey(name: "refresh_token")
  String? refreshToken;

  DefaultResponse({
    required this.message,
    required this.status,
    this.accessToken,
    this.refreshToken,
  });

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}
