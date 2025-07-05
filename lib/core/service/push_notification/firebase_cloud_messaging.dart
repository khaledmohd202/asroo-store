import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/service/push_notification/firebase_messaging_navigator.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;

class FirebaseCloudMessaging {
  factory FirebaseCloudMessaging() => _instance;

  FirebaseCloudMessaging._();

  static final FirebaseCloudMessaging _instance = FirebaseCloudMessaging._();

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  bool isNotificationPermissionGranted = false;
  ValueNotifier<bool> isNotificationSubscribed = ValueNotifier(true);

  static const String subscribeKey = 'asroo-store';

  // initialize notifications for this app or device
  Future<void> initNotification() async {
    // Request permission for notifications.
    await _requestPermissionNotification();

    // Foreground message handler.
    FirebaseMessaging.onMessage.listen(
      FirebaseMessagingNavigator.forGroundHandler,
    );

    // Terminated message handler.
    await FirebaseMessaging.instance.getInitialMessage().then(
      FirebaseMessagingNavigator.terminatedHandler
    );

    // Background message handler.
    FirebaseMessaging.onMessageOpenedApp.listen(
      FirebaseMessagingNavigator.backGroundHandler,
    );

    // get device token
    final deviceToken = await _firebaseMessaging.getToken();
    debugPrint(
      '===================Device FirebaseMessaging Token====================',
    );
    debugPrint(deviceToken);
    debugPrint(
      '===================Device FirebaseMessaging Token====================',
    );
  }

  // get Access Token
  Future<String?> getAccessToken() async {
    // JSON File of Notification Key in env variables for more security.
    final jsonString = EnvVariable.instance.getGoogleServiceAccountJson;
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final clientCredentials = auth.ServiceAccountCredentials.fromJson(
      jsonString,
    );

    final client = await auth.clientViaServiceAccount(
      clientCredentials,
      scopes,
    );

    return client.credentials.accessToken.data;
  }

  // controller for user subscription to notifications.
  Future<void> controllerForUserSubscribe(BuildContext context) async {
    if (isNotificationPermissionGranted == false) {
      await _requestPermissionNotification();
    } else {
      if (isNotificationSubscribed.value == false) {
        await _subscribeToTopic();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.subscribedToNotifications),
          seconds: 1,
        );
      } else {
        await _unsubscribeFromTopic();
        if (!context.mounted) return;
        ShowToast.showToastSuccessTop(
          message: context.translate(LangKeys.unsubscribedToNotifications),
          seconds: 1,
        );
      }
    }
  }

  // Permission request for notifications.
  Future<void> _requestPermissionNotification() async {
    final settings = await _firebaseMessaging.requestPermission(badge: false);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      isNotificationPermissionGranted = true;
      await _subscribeToTopic();
      debugPrint('🔔🔔 User accepted the notification permission');
    } else {
      isNotificationPermissionGranted = false;
      isNotificationSubscribed.value = false;
      debugPrint('🔕🔕 User not accepted the notification permission');
    }
  }

  // Send notification to a specific user using FCM token.
  Map<String, dynamic> tokenNotificationBody({
    required String fcmToken, // we use fcmToken to send to a specific user.
    required String title,
    required String body,
    required String userId,
    String? type,
  }) {
    return {
      'message': {
        'token': fcmToken,
        'notification': {'title': title, 'body': body},
        'android': {
          'notification': {
            'notification_priority': 'PRIORITY_MAX',
            // 'click_action': // Required for tapping to trigger response.
            //     'FLUTTER_NOTIFICATION_CLICK',
            // 'channel_id': 'high_importance_channel',
            'sound': 'default',
          },
        },
        'apns': {
          'payload': {
            'aps': {'content_available': true},
          },
        },
        'data': {
          'type': type,
          'id': userId,
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        },
      },
    };
  }

  Future<void> sendSpecificNotification({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) async {
    try {
      // Get OAuth2 access token
      final accessToken = await getAccessToken();

      // FCM v1 endpoint
      final urlEndPoint = EnvVariable.instance.urlEndpoint;

      final dio = Dio();

      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $accessToken';

      final response = await dio.post<Map<String, dynamic>>(
        urlEndPoint,
        data: tokenNotificationBody(
          fcmToken: fcmToken,
          title: title,
          body: body,
          userId: userId,
          type: type ?? 'message',
        ),
      );

      // Print response status code and body for debugging
      debugPrint(
        '============================================================',
      );
      debugPrint(
        '============================================================',
      );
      debugPrint('Response Status Code: ${response.statusCode}');
      debugPrint('Response Data: ${response.data}');
      debugPrint(
        '=============================================================',
      );
      debugPrint(
        '=============================================================',
      );
    } on Exception catch (e) {
      // Handle any errors that occur during the request
      debugPrint('Error sending notification: $e');
    }
  }

  // Send notification to a topic.
  Map<String, dynamic> topicNotificationBody({
    required String title,
    required String body,
    String? type,
    int? productId,
  }) {
    final data = <String, dynamic>{
      'type': type ?? 'message',
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
    };
    // If you want to send productId, uncomment the line below.
    // and make sure to pass productId when calling this method.
    if (productId != null) data['productId'] = productId.toString();

    return {
      'message': {
        'topic': subscribeKey,
        'notification': {'title': title, 'body': body},
        'android': {
          'notification': {
            'notification_priority': 'PRIORITY_MAX',
            'sound': 'default',
          },
        },
        'apns': {
          'payload': {
            'aps': {'content_available': true},
          },
        },
        'data': data,
      },
    };
  }

  Future<void> sendTopicNotification({
    required String title,
    required String body,
    String? type,
    int? productId,
  }) async {
    try {
      // Get OAuth2 access token
      final accessToken = await getAccessToken();

      // FCM v1 endpoint
      final urlEndPoint = EnvVariable.instance.urlEndpoint;

      final dio = Dio();

      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $accessToken';

      final response = await dio.post<Map<String, dynamic>>(
        urlEndPoint,
        data: topicNotificationBody(
          title: title,
          body: body,
          type: type,
          productId: productId,
        ),
      );

      debugPrint(
        '============================================================',
      );
      debugPrint('Response Status Code: ${response.statusCode}');
      debugPrint('Response Data: ${response.data}');
      debugPrint(
        '============================================================',
      );
    } on Exception catch (e) {
      debugPrint('Error sending topic notification: $e');
    }
  }

  // This method uses the old FirebaseCloudMessaging API and is not recommended.
  // Future<void> sendTopicNotification() async {
  //   try {
  //     final response = await Dio().post<dynamic>(
  //       EnvVariable.instance.notificationBaseUrl,
  //       options: Options(
  //         validateStatus: (_) => true,
  //         contentType: Headers.jsonContentType,
  //         responseType: ResponseType.json,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'key=${EnvVariable.instance.firebaseKey}',
  //         },
  //       ),
  //       data: {
  //         'to':,
  //         'notification': {
  //           'title': 'Check this Mobile (title)',
  //           'body': 'Rich Notification testing (body)',
  //         },
  //         // 'data': {'productId': productId},
  //       },
  //     );
  //     debugPrint('Notification Created => ${response.data}');
  //     //
  //     // ignore: avoid_catches_without_on_clauses
  //   } catch (e) {
  //     debugPrint('Notification Created => $e');
  //   }
  // }

  /// Subscribe to a topic for receiving notifications.
  Future<void> _subscribeToTopic() async {
    isNotificationSubscribed.value = true;
    await _firebaseMessaging.subscribeToTopic(subscribeKey);
    debugPrint('====🔔 Notification Subscribed 🔔=====');
    debugPrint('Subscribed to topic: $subscribeKey');
    debugPrint('====🔔 Notification Subscribed 🔔=====');
  }

  /// Unsubscribe from a topic to stop receiving notifications.
  Future<void> _unsubscribeFromTopic() async {
    isNotificationSubscribed.value = false;
    await _firebaseMessaging.unsubscribeFromTopic(subscribeKey);
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
    debugPrint('Unsubscribed from topic: $subscribeKey');
    debugPrint('====🔕 Notification Unsubscribed 🔕=====');
  }
}
