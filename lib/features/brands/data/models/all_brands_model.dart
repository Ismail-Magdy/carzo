import 'package:json_annotation/json_annotation.dart';

part 'all_brands_model.g.dart';

@JsonSerializable(createJsonSchema: true)
class AllBrandsModel {
  final String name;
  final String pictureUrl;
  final int? id;

  AllBrandsModel({
    required this.name,
    required this.pictureUrl,
    required this.id,
  });

  factory AllBrandsModel.fromJson(Map<String, dynamic> json) =>
      _$AllBrandsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllBrandsModelToJson(this);

  static const jsonSchema = _$AllBrandsModelJsonSchema;
}
