import 'package:json_annotation/json_annotation.dart';

part 'car_brand_model.g.dart';

@JsonSerializable(createJsonSchema: true)
class CarBrandModel {
  int? carId;
  String? status;
  String? carName;
  int? price;
  String? condition;
  String? dealershipName;
  List<Url>? url;
  bool? isInFav;

  CarBrandModel({
    this.carId,
    this.status,
    this.carName,
    this.price,
    this.condition,
    this.dealershipName,
    this.url,
    this.isInFav,
  });

  factory CarBrandModel.fromJson(Map<String, dynamic> json) =>
      _$CarBrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$CarBrandModelToJson(this);

  static const jsonSchema = _$CarBrandModelJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class Url {
  String? url;

  Url({this.url});

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  Map<String, dynamic> toJson() => _$UrlToJson(this);

  static const jsonSchema = _$UrlJsonSchema;
}
