// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };

const _$SignUpRequestModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'firstName': {'type': 'string'},
    'lastName': {'type': 'string'},
    'phoneNumber': {'type': 'string'},
    'userName': {'type': 'string'},
    'email': {'type': 'string'},
    'password': {'type': 'string'},
  },
  'required': [
    'firstName',
    'lastName',
    'phoneNumber',
    'userName',
    'email',
    'password',
  ],
};
