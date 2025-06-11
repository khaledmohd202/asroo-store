// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCategoryRequestBody _$UpdateCategoryRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateCategoryRequestBody(
      image: json['image'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UpdateCategoryRequestBodyToJson(
        UpdateCategoryRequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'id': instance.id,
    };
