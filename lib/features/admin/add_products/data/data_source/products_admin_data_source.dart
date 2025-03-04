import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/admin/product_queries.dart';
import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';

class ProductsAdminDataSource {
  ProductsAdminDataSource(this._graphql);

  final ApiService _graphql;

  Future<GetAllProductResponse> getAllProductsAdmin() async {
    final response = await _graphql.getAllProduct(
      ProductQueries().getAllProductsMapQuery(),
    );

    return response;
  }

  // Create a new Product Admin.
  Future<void> createProductAdmin({
    required CreateProductRequestBody body,
  }) async {
    final response = await _graphql.createProduct(
      ProductQueries().createProductMapQuery(body: body),
    );

    return response;
  }
}
