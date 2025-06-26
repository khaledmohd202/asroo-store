import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/customer/products_view_all_queries.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';

class ProductsViewAllDataSource {
  ProductsViewAllDataSource(this._graphql);

  final ApiService _graphql;

  // ViewAll Products
  Future<GetAllProductResponse> getProductsViewAll({
    required int offset,
  }) async {
    final response = await _graphql.getProductsViewAll(
      ProductsViewAllQueries().getProductsViewAllMapQuery(offset: offset),
    );

    return response;
  }
}
