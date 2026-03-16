import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_model.g.dart';

@JsonSerializable(createJsonSchema: true)
class SignUpRequestModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userName;
  final String email;
  final String password;

  SignUpRequestModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userName,
    required this.email,
    required this.password,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);

  static const jsonSchema = _$SignUpRequestModelJsonSchema;
}
