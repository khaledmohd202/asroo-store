import 'package:asroo_store/features/admin/add_notification/presentation/widgets/create/create_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 20.h),
      child: const Column(
        children: [
          // Create Notification Title.
          CreateNotifications(),
        ],
      ),
    );
  }
}
