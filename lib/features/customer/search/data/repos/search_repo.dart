import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/customer/search/data/data_source/search_data_source.dart';
import 'package:asroo_store/features/customer/search/data/model/search_request_body.dart';

class SearchRepo {
  SearchRepo(this._searchDataSource);

  final SearchDataSource _searchDataSource;

  // Fetch products by price range and title.
  Future<ApiResult<GetAllProductResponse>> searchProduct({
    required SearchRequestBody body,
  }) async {
    try {
      final response = await _searchDataSource.searchProduct(body: body);

      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure('$errorMessage: $e');
    }
  }
}
