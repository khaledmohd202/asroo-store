import 'package:json_annotation/json_annotation.dart';
part 'get_all_product_response.g.dart';

@JsonSerializable()
class GetAllProductResponse {
  GetAllProductResponse(this.data);

  factory GetAllProductResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductResponseFromJson(json);

  final GetAllProductData data;

  List<GetAllProductModel> get getAllProductList {
    if (data.productList.isEmpty) {
      return [];
    }
    return data.productList;
  }
}

@JsonSerializable()
class GetAllProductData {
  GetAllProductData(this.productList);

  factory GetAllProductData.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductDataFromJson(json);

  @JsonKey(name: 'products')
  final List<GetAllProductModel> productList;
}

@JsonSerializable()
class GetAllProductModel {
  GetAllProductModel(
    this.id,
    this.title,
    this.price,
    this.images,
    this.description,
    this.category,
  );

  factory GetAllProductModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductModelFromJson(json);

  final String? id;
  final String? title;
  final double? price;
  final List<String>? images;
  final String? description;
  final CategoryProductModel? category;
}

@JsonSerializable()
class CategoryProductModel {
  CategoryProductModel(this.id, this.name);

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductModelFromJson(json);

  final String? id;
  final String? name;
}
