import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/customer/category/data/data_source/category_data_source.dart';

class CategoryRepo {
  CategoryRepo(this._dataSource);

  final CategoryDataSource _dataSource;

  // Fetch products for a specific category
  Future<ApiResult<GetAllProductResponse>> getCategoryProducts({
    required int categoryId,
  }) async {
    try {
      final response = await _dataSource.getCategoryProducts(
        categoryId: categoryId,
      );

      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure('$errorMessage: $e.');
    }
  }
}
