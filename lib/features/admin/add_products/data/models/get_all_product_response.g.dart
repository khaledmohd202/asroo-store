// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductResponse _$GetAllProductResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllProductResponse(
      GetAllProductData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductResponseToJson(
        GetAllProductResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

GetAllProductData _$GetAllProductDataFromJson(Map<String, dynamic> json) =>
    GetAllProductData(
      (json['products'] as List<dynamic>)
          .map((e) => GetAllProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductDataToJson(GetAllProductData instance) =>
    <String, dynamic>{
      'products': instance.productList,
    };

GetAllProductModel _$GetAllProductModelFromJson(Map<String, dynamic> json) =>
    GetAllProductModel(
      json['id'] as String?,
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['description'] as String?,
      json['category'] == null
          ? null
          : CategoryProductModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAllProductModelToJson(GetAllProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'images': instance.images,
      'description': instance.description,
      'category': instance.category,
    };

CategoryProductModel _$CategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    CategoryProductModel(
      json['id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CategoryProductModelToJson(
        CategoryProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
