import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/customer/category_queries.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';

class CategoryDataSource {
  CategoryDataSource(this._graphql);

  final ApiService _graphql;

  // Fetch categories from the GraphQL API
  Future<GetAllProductResponse> getCategoryProducts({
    required int categoryId,
  }) async {
    final response = await _graphql.getProductsViewAll(
      CategoryQueries().getCategoriesMapQuery(categoryId: categoryId),
    );
    return response;
  }
}
