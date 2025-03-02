import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/admin/categories_queries.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/update_category_request_body.dart';

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

  // Create a new Category
  Future<CreateCategoryResponse> createCategory(
    CreateCategoryRequestBody body,
  ) async {
    final response = await _graphql.createCategory(
      CategoriesQueries().createCategoryMapQuery(body: body),
    );

    return response;
  }

  // Delete an exist Category
  Future<void> deleteCategory(String categoryId) async {
    final response = await _graphql.deleteCategory(
      CategoriesQueries().deleteCategoryMapQuery(categoryId: categoryId),
    );

    return response;
  }

  // Update The Categories.
  Future<void> updateCategory(UpdateCategoryRequestBody body) async {
    final response = await _graphql.updateCategory(
      CategoriesQueries().updateCategoryMapQuery(body: body),
    );

    return response;
  }
}
