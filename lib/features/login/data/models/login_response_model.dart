import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(createJsonSchema: true)
class LoginResponseModel {
  final String? displayName;
  final String? email;
  final String? token;
  final String? appUserId;

  LoginResponseModel({
    this.displayName,
    this.email,
    this.token,
    this.appUserId,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  static const jsonSchema = _$LoginResponseModelJsonSchema;
}
