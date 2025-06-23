import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/customer/product_details/data/data_source/product_details_data_source.dart';
import 'package:asroo_store/features/customer/product_details/data/models/product_details_response.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._dataSource);

  final ProductDetailsDataSource _dataSource;

  // Get Product Details.
  Future<ApiResult<ProductDetailsResponse>> getProductDetails({
    required int productId,
  }) async {
    try {
      final response = await _dataSource.getProductDetails(
        productId: productId,
      );
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure('$errorMessage: $e');
    }
  }
}
