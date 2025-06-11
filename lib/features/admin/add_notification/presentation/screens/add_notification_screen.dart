import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/service/push_notification/firebase_cloud_messaging.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DarkColors.mainColor,
      appBar: const AdminAppBar(
        title: 'Notifications',
        backgroundColor: DarkColors.mainColor,
        isMain: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Send Notification',
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                FirebaseCloudMessaging().sendTopicNotification(
                  title: 'Test Notification',
                  body: 'This is a test notification from Asroo Store.',
                );
              },
              child: Text(
                'Send Notification',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
