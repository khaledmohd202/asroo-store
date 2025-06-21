import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/admin/categories_queries.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/customer/home_queries.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:asroo_store/features/customer/home/data/models/banners_response.dart';

class HomeDataSource {
  const HomeDataSource(this._graphql);

  final ApiService _graphql;

  // Get Banners.
  Future<BannersResponse> getBanners() async {
    final response = await _graphql.getBanner(
      HomeQueries().getBannersMapQuery(),
    );

    return response;
  }

  // Get all categories.
  Future<GetAllCategoriesResponse> getAllCategories() async {
    final response = await _graphql.getAllCategories(
      CategoriesQueries().getAllCategoriesMapQuery(),
    );

    return response;
  }
}
