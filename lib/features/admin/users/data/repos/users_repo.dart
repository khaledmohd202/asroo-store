//
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/users/data/data_source/users_data_source.dart';
import 'package:asroo_store/features/admin/users/data/models/get_all_users_response.dart';

class UsersRepo {
  UsersRepo(this._dataSource);

  final UsersDataSource _dataSource;

  // Get All Users.
  Future<ApiResult<GetAllUsersResponse>> getAllUsers() async {
    try {
      final response = await _dataSource.getAllUsers();

      return ApiResult.success(response);
    } catch (e) {
      return const ApiResult.failure(errorMessage);
    }
  }
}
