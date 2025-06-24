import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/customer/product_details_queries.dart';
import 'package:asroo_store/features/customer/product_details/data/models/product_details_response.dart';

class ProductDetailsDataSource {
  ProductDetailsDataSource(this._graphql);

  final ApiService _graphql;

  // Get Product Details.
  Future<ProductDetailsResponse> getProductDetails({
    required int productId,
  }) async {
    final response = await _graphql.productDetails(
      ProductDetailsQueries().getProductDetailsMapQuery(productId: productId),
    );

    return response;
  }
}
