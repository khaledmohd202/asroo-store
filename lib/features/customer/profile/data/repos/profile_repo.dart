import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/auth/data/models/user_role_response.dart';
import 'package:asroo_store/features/customer/profile/data/data_source/profile_data_source.dart';

class ProfileRepo {
  ProfileRepo(this._dataSource);

  final ProfileDataSource _dataSource;

  // Get User Information.
  Future<ApiResult<UserRoleResponse>> getUserInformation() async {
    try {
      final response = await _dataSource.getUserInformation();
      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure('$errorMessage: $e');
    }
  }
}
