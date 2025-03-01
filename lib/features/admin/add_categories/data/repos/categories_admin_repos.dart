import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';

class CategoriesAdminRepos {
  const CategoriesAdminRepos(this._dataSource);

  final CategoriesAdminDataSource _dataSource;

  // Get All categories "Admin".
  Future<ApiResult<GetAllCategoriesResponse>> getAllCategoriesAdmin() async {
    try {
      final response = await _dataSource.getAllCategoriesAdmin();

      return ApiResult.success(response);
    //
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
