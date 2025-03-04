//
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:asroo_store/features/admin/add_products/data/models/update_product_request_body.dart';
import 'package:flutter/rendering.dart';

class ProductAdminRepo {
  ProductAdminRepo(this._dataSource);

  final ProductsAdminDataSource _dataSource;

  // Get All Products Admin.
  Future<ApiResult<GetAllProductResponse>> getAllProductsAdmin() async {
    try {
      final response = await _dataSource.getAllProductsAdmin();
      return ApiResult.success(response);
    } catch (e) {
      debugPrint('error Product ============> $e');
      return const ApiResult.failure(errorMessage);
    }
  }

  // Create a new Product Admin.
  Future<ApiResult<void>> createProductAdmin({
    required CreateProductRequestBody body,
  }) async {
    try {
      final response = await _dataSource.createProductAdmin(body: body);

      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }

  // Delete an exist Product.
  Future<ApiResult<void>> deleteProduct({required String productId}) async {
    try {
      final response = await _dataSource.deleteProduct(productId: productId);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }

  // Update the Products.
  Future<ApiResult<void>> updateProduct({
    required UpdateProductRequestBody body,
  }) async {
    try {
      final response = await _dataSource.updateProduct(body: body);
      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
