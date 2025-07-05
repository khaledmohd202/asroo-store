import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/service/push_notification/local_notification_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class FirebaseMessagingNavigator {
  // ForeGround
  static Future<void> forGroundHandler(RemoteMessage? message) async {
    if (message != null) {
      await LocalNotificationService.showSimpleNotification(
        title: message.notification?.title ?? 'No Title',
        body: message.notification?.body ?? 'No Body',
        payload: message.data['productId'].toString(),
      );
    }
  }

  // BackGround
  static void backGroundHandler(RemoteMessage? message) {
    if (message != null) {
      _navigate(message);
    }
  }

  // Terminated
  static void terminatedHandler(RemoteMessage? message)  {
    if (message != null) {
      _navigate(message);
    }
  }

  static void _navigate(RemoteMessage message) {
    if (int.parse(message.data['productId'].toString()) == -1) return;
    sl<GlobalKey<NavigatorState>>().currentState!.context.pushNamed(
      AppRoutes.productDetails,
      arguments: int.parse(message.data['productId'].toString()),
    );
  }
}
