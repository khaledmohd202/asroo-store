import 'package:json_annotation/json_annotation.dart';
part 'get_all_categories_response.g.dart';

@JsonSerializable()
class GetAllCategoriesResponse {
  GetAllCategoriesResponse(this.data);

  factory GetAllCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesResponseFromJson(json);

  List<GetAllCategoriesModel> get getAllCategoriesList {
    if (data.categoriesList.isEmpty) {
      return [];
    }
    return data.categoriesList;
  }

  final GetAllCategoriesData data;
}

@JsonSerializable()
class GetAllCategoriesData {
  GetAllCategoriesData(this.categoriesList);

  factory GetAllCategoriesData.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesDataFromJson(json);

  @JsonKey(name: 'categories')
  final List<GetAllCategoriesModel> categoriesList;
}

@JsonSerializable()
class GetAllCategoriesModel {
  GetAllCategoriesModel(this.id, this.name, this.image);

  factory GetAllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllCategoriesModelFromJson(json);

  final String? id;
  final String? name;
  final String? image;
}
