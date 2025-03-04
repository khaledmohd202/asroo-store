//
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:flutter/rendering.dart';

class ProductAdminRepo {
  ProductAdminRepo(this._dataSource);

  final ProductsAdminDataSource _dataSource;

  Future<ApiResult<GetAllProductResponse>> getAllProductsAdmin() async {
    try {
      final response = await _dataSource.getAllProductsAdmin();
      return ApiResult.success(response);
    } catch (e) {
      debugPrint('error Product ============> $e');
      return const ApiResult.failure(errorMessage);
    }
  }
}
