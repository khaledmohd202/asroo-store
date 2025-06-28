import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/customer/search_queries.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/customer/search/data/model/search_request_body.dart';

class SearchDataSource {
  SearchDataSource(this._graphql);

  final ApiService _graphql;

  // Fetch products by price range and title.
  Future<GetAllProductResponse> searchProduct({
    required SearchRequestBody body,
  }) async {
    final response = await _graphql.searchProduct(
      SearchQueries().searchProduct(body: body),
    );

    return response;
  }
}
