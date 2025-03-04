//
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/create_category_response.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/update_category_request_body.dart';

class CategoriesAdminRepos {
  const CategoriesAdminRepos(this._dataSource);

  final CategoriesAdminDataSource _dataSource;

  // Get All categories "Admin".
  Future<ApiResult<GetAllCategoriesResponse>> getAllCategoriesAdmin() async {
    try {
      final response = await _dataSource.getAllCategoriesAdmin();

      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }

  // Create a new Category
  Future<ApiResult<CreateCategoryResponse>> createCategory({
    required CreateCategoryRequestBody body,
  }) async {
    try {
      final response = await _dataSource.createCategory(body);

      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }

  // Delete an exist Category.
  Future<ApiResult<void>> deleteCategory({required String categoryId}) async {
    try {
      final response = await _dataSource.deleteCategory(categoryId: categoryId);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }

  // Update the Categories.
  Future<ApiResult<void>> updateCategory({
    required UpdateCategoryRequestBody body,
  }) async {
    try {
      final response = await _dataSource.updateCategory(body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
