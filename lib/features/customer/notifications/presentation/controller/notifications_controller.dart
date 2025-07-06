import 'package:asroo_store/core/service/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/customer/notifications/data/models/notifications_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsController {
  NotificationsController();

  final Query<Map<String, dynamic>> notificationDatabase = FirebaseFirestore
      .instance
      .collection(usersCollection)
      .doc(SharedPref().getInt(PrefKeys.userId).toString())
      .collection(notificationCollection)
      .orderBy('created_at', descending: true);

  Stream<List<NotificationsModel>> getNotificationsList() {
    return notificationDatabase.snapshots().map((value) {
      return value.docs.map((doc) {
        final data = doc.data();
        return NotificationsModel.fromJson(data);
      }).toList();
    });
  }
}
