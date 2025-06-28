// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponse _$ProductDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsResponse(
      ProductDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsResponseToJson(
        ProductDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductDetailsData _$ProductDetailsDataFromJson(Map<String, dynamic> json) =>
    ProductDetailsData(
      ProductDetailsModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsDataToJson(ProductDetailsData instance) =>
    <String, dynamic>{
      'product': instance.product,
    };

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      json['description'] as String?,
      json['id'] as String?,
      json['category'] == null
          ? null
          : CategoryDetailsModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'images': instance.images,
      'description': instance.description,
      'category': instance.category,
    };

CategoryDetailsModel _$CategoryDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CategoryDetailsModel(
      json['name'] as String,
    );

Map<String, dynamic> _$CategoryDetailsModelToJson(
        CategoryDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
