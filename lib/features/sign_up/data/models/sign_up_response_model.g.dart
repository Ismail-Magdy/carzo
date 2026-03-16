// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignUpResponseModelToJson(
  SignUpResponseModel instance,
) => <String, dynamic>{
  'displayName': instance.displayName,
  'email': instance.email,
  'token': instance.token,
};

const _$SignUpResponseModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'displayName': {'type': 'string'},
    'email': {'type': 'string'},
    'token': {'type': 'string'},
  },
  'required': ['displayName', 'email', 'token'],
};
