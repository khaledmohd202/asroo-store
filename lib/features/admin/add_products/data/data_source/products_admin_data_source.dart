import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/admin/product_queries.dart';
import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/admin/add_products/data/models/update_product_request_body.dart';

class ProductsAdminDataSource {
  ProductsAdminDataSource(this._graphql);

  final ApiService _graphql;

  Future<GetAllProductResponse> getAllProductsAdmin() async {
    final response = await _graphql.getAllProducts(
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

  // Delete an exist Product.
  Future<void> deleteProduct({required String productId}) async {
    final response = await _graphql.deleteProduct(
      ProductQueries().deleteProductMapQuery(productId: productId),
    );

    return response;
  }

  // Update The Products.
  Future<void> updateProduct({required UpdateProductRequestBody body}) async {
    final response = await _graphql.updateProduct(
      ProductQueries().updateProductMapQuery(body: body),
    );

    return response;
  }
}
