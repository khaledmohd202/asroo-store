import 'package:json_annotation/json_annotation.dart';
part 'create_product_request_body.g.dart';

@JsonSerializable()
class CreateProductRequestBody {
  CreateProductRequestBody({
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.imageList,
  });

  final String title;
  final double price;
  final String description;
  final double categoryId;
  final List<String> imageList;

  Map<String, dynamic> toJson() => _$CreateProductRequestBodyToJson(this);
}
