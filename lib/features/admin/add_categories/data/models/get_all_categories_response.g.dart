// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllCategoriesResponse _$GetAllCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesResponse(
  GetAllCategoriesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetAllCategoriesResponseToJson(
  GetAllCategoriesResponse instance,
) => <String, dynamic>{'data': instance.data};

GetAllCategoriesData _$GetAllCategoriesDataFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesData(
  (json['categories'] as List<dynamic>)
      .map((e) => GetAllCategoriesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetAllCategoriesDataToJson(
  GetAllCategoriesData instance,
) => <String, dynamic>{'categories': instance.categoriesList};

GetAllCategoriesModel _$GetAllCategoriesModelFromJson(
  Map<String, dynamic> json,
) => GetAllCategoriesModel(
  json['id'] as String?,
  json['name'] as String?,
  json['image'] as String?,
);

Map<String, dynamic> _$GetAllCategoriesModelToJson(
  GetAllCategoriesModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
