import 'package:json_annotation/json_annotation.dart';

part 'auth.model.g.dart';

@JsonSerializable()
class Auth {
  final String accessToken;

  Auth({
    required this.accessToken,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
