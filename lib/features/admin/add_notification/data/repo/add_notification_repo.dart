import 'package:asroo_store/core/service/graphql/api_result.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/admin/add_notification/data/data_source/add_notification_data_source.dart';

class AddNotificationRepo {
  AddNotificationRepo(this._dataSource);

  final AddNotificationDataSource _dataSource;

  // Send Notification to all users.
  Future<ApiResult<void>> sendNotifications({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await _dataSource.sendNotifications(
        title: title,
        body: body,
        productId: productId,
      );

      return ApiResult.success(response);
    } on Exception catch (e) {
      return ApiResult.failure('$errorMessage: $e');
    }
  }

  // Add Notification to all users in Cloud Firestore.
  Future<void> addNotificationToAllUsersFirebase({
    required String title,
    required String body,
    required int productId,
  }) async {
    await _dataSource.addNotificationToAllUsersFirebase(
      title: title,
      body: body,
      productId: productId,
    );
  }
}
