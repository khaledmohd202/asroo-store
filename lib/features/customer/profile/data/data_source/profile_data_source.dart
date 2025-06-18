import 'package:asroo_store/core/service/graphql/api_service.dart';
import 'package:asroo_store/features/auth/data/models/user_role_response.dart';

class ProfileDataSource {
  ProfileDataSource(this._apiService);

  final ApiService _apiService;

  // Get All User Info.
  Future<UserRoleResponse> getUserInformation() async {
    final response = await _apiService.userRole();
    return response;
  }
}
