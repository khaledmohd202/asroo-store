import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  ProductDetailsResponse(this.data);

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  final ProductDetailsData data;
}

@JsonSerializable()
class ProductDetailsData {
  ProductDetailsData(this.product);

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataFromJson(json);

  @JsonKey(name: 'product')
  final ProductDetailsModel product;
}

@JsonSerializable()
class ProductDetailsModel {
  ProductDetailsModel(
    this.title,
    this.price,
    this.images,
    this.description,
    this.id,
    this.category,
  );

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsModelFromJson(json);

  final String? id;
  final String? title;
  final double? price;
  final List<String> images;
  final String? description;
  final CategoryDetailsModel? category;
}

@JsonSerializable()
class CategoryDetailsModel {
  CategoryDetailsModel(this.name);

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailsModelFromJson(json);

  final String name;
}
