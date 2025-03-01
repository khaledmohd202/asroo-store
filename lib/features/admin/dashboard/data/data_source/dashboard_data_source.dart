import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/admin/dashboard_queries.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/categories_number_response.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/products_number_response.dart';
import 'package:asroo_store/features/admin/dashboard/data/models/users_number_response.dart';

class DashboardDataSource {
  const DashboardDataSource(this._graphql);

  final ApiService _graphql;

  // Get the number of Products
  Future<ProductsNumberResponse> numberOfProducts() async {
    final response = await _graphql.numberOfProducts(
      DashboardQueries().numberOfProductsMapQuery(),
    );

    return response;
  }

  // Get the number of Categories
  Future<CategoriesNumberResponse> numberOfCategories() async {
    final response = await _graphql.numberOfCategories(
      DashboardQueries().numberOfCategoriesMapQuery(),
    );

    return response;
  }

  // Get the number of Users
  Future<UsersNumberResponse> numberOfUsers() async {
    final response = await _graphql.numberOfUsers(
      DashboardQueries().numberOfUsersMapQuery(),
    );
    return response;
  }
}
