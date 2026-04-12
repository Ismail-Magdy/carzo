// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarBrandModel _$CarBrandModelFromJson(Map<String, dynamic> json) =>
    CarBrandModel(
      carId: (json['carId'] as num?)?.toInt(),
      status: json['status'] as String?,
      carName: json['carName'] as String?,
      price: (json['price'] as num?)?.toInt(),
      condition: json['condition'] as String?,
      dealershipName: json['dealershipName'] as String?,
      url: (json['url'] as List<dynamic>?)
          ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
          .toList(),
      isInFav: json['isInFav'] as bool?,
    );

Map<String, dynamic> _$CarBrandModelToJson(CarBrandModel instance) =>
    <String, dynamic>{
      'carId': instance.carId,
      'status': instance.status,
      'carName': instance.carName,
      'price': instance.price,
      'condition': instance.condition,
      'dealershipName': instance.dealershipName,
      'url': instance.url,
      'isInFav': instance.isInFav,
    };

const _$CarBrandModelJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'carId': {'type': 'integer'},
    'status': {'type': 'string'},
    'carName': {'type': 'string'},
    'price': {'type': 'integer'},
    'condition': {'type': 'string'},
    'dealershipName': {'type': 'string'},
    'url': {
      'type': 'array',
      'items': {r'$ref': r'#/$defs/Url'},
    },
    'isInFav': {'type': 'boolean'},
  },
  r'$defs': {
    'Url': {
      'type': 'object',
      'properties': {
        'url': {'type': 'string'},
      },
    },
  },
};

Url _$UrlFromJson(Map<String, dynamic> json) =>
    Url(url: json['url'] as String?);

Map<String, dynamic> _$UrlToJson(Url instance) => <String, dynamic>{
  'url': instance.url,
};

const _$UrlJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'url': {'type': 'string'},
  },
};
