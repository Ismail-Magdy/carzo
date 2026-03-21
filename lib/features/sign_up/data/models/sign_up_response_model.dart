import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_model.g.dart';

@JsonSerializable(createJsonSchema: true)
class SignUpResponseModel {
  final String? displayName;
  final String? email;
  final String? token;

  SignUpResponseModel({
    required this.displayName,
    required this.email,
    required this.token,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  /// DONOT NEED THIS
  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
  //

  static const jsonSchema = _$SignUpResponseModelJsonSchema;
}
