import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/admin/categories_queries.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';

class CategoriesAdminDataSource {
  const CategoriesAdminDataSource(this._graphql);

  final ApiService _graphql;

  //Get All categories "Admin".
  Future<GetAllCategoriesResponse> getAllCategoriesAdmin() async {
    final response = await _graphql.getAllCategories(
      CategoriesQueries().getAllCategoriesMapQuery(),
    );

    return response;
  }
}
