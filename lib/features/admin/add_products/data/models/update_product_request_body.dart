import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_product_request_body.g.dart';

@JsonSerializable()
class UpdateProductRequestBody {
  UpdateProductRequestBody({
    required this.title,
    required this.price,
    required this.imageList,
    required this.description,
    required this.categoryId,
    required this.productId,
  });

  final String title;
  final double price;
  final List<String> imageList;
  final String description;
  final double categoryId;
  final String productId;

  Map<String, dynamic> toJson() => _$UpdateProductRequestBodyToJson(this);
}
