import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';

class AddNotificationDataSource {
  // Send Notification Topics to Users.
  Future<void> sendNotifications({
    required String title,
    required String body,
    required int productId,
  }) async {
    final response = await FirebaseCloudMessaging().sendTopicNotification(
      title: title,
      body: body,
      productId: productId,
    );
    return response;
  }
}
