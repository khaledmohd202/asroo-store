import 'package:asroo_store/core/extensions/string_extension.dart';
import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/core/utils/app_values.dart';
import 'package:asroo_store/features/customer/notifications/data/models/notifications_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  // Add Notifications to all users in Cloud Firestore.
  Future<void> addNotificationToAllUsersFirebase({
    required String title,
    required String body,
    required int productId,
  }) async {
    final notificationId = AppValues.randomStringId;
    const createdAt = '';

    final users = FirebaseFirestore.instance.collection(usersCollection);

    final usersGet = await users.get();

    for (final doc in usersGet.docs) {
      await users
          .doc(doc.id)
          .collection(notificationCollection)
          .doc(notificationId)
          .set(
            NotificationsModel(
              notificationId: notificationId,
              title: title,
              body: body,
              createdAt: createdAt.convertDataFormate(),
              isRead: false,
              productId: productId,
            ).toJson(),
          );
    }
  }
}
