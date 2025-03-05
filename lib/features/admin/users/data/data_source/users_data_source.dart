import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/admin/users_queries.dart';
import 'package:asroo_store/features/admin/users/data/models/get_all_users_response.dart';

class UsersDataSource {
  UsersDataSource(this._graphql);

  final ApiService _graphql;

  // Get All Users.
  Future<GetAllUsersResponse> getAllUsers() async {
    final response = await _graphql.getAllUsers(UsersQueries().getAllUsers());

    return response;
  }
}
