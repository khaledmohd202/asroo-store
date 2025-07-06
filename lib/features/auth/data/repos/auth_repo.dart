import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/features/auth/data/data_source/auth_data_source.dart';
import 'package:asroo_store/features/auth/data/models/login_request_body.dart';
import 'package:asroo_store/features/auth/data/models/login_response.dart';
import 'package:asroo_store/features/auth/data/models/sign_up_request_body.dart';
import 'package:asroo_store/features/auth/data/models/sign_up_response.dart';
import 'package:asroo_store/features/auth/data/models/user_role_response.dart';

class AuthRepo {
  const AuthRepo(this._dataSource);
  final AuthDataSource _dataSource;

  //Login
  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _dataSource.login(body: body);
      return ApiResult.success(response);
      //
      // ignore: avoid_catches_without_on_clauses
    } catch (error) {
      return const ApiResult.failure(LangKeys.loggedError);
    }
  }

  //Get User Role
  Future<UserRoleResponse> userRole(String token) async {
    final response = await _dataSource.userRole(token);

    return response;
  }

  //SignUp
  Future<ApiResult<SignUpResponse>> signUp(SignUpRequestBody body) async {
    try {
      final response = await _dataSource.signUp(body: body);
      return ApiResult.success(response);
    //
    // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      return const ApiResult.failure('Please, try again we have error.');
    }
  }

  // Add User ID in Firebase to used with Notification DataBase.
  Future<void> addUserIdToFirebase({required String userId}) async {
    await _dataSource.addUserIdToFirebase(userId: userId);
  }
}
