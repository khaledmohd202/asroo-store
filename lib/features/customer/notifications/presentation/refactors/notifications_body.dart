import 'package:asroo_store/features/customer/notifications/presentation/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const NotificationItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10.h);
        },
      ),
    );
  }
}
