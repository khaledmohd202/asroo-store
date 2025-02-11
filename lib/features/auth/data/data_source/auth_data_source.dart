import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/core/service/graphql/graphql_queries/auth_queries.dart';
import 'package:asroo_store/features/auth/data/models/login_request_body.dart';
import 'package:asroo_store/features/auth/data/models/login_response.dart';
import 'package:asroo_store/features/auth/data/models/user_role_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthDataSource {
  const AuthDataSource(this._graphql);
  final ApiService _graphql;

  //Login
  Future<LoginResponse> login({required LoginRequestBody body}) async {
    final response = await _graphql.login(
      AuthQueries().loginMapQuery(body: body),
    );
    return response;
  }

  //UserRole
  Future<UserRoleResponse> userRole(String token) async {
    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    final client = ApiService(dio);
    final response = await client.userRole();

    debugPrint('User Role ==> ${response.userRole}');
    return response;
  }
}
