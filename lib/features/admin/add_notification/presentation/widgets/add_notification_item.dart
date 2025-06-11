import 'package:asroo_store/core/common/widgets/custom_container_linear_admin.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/extensions/date_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/widgets/delete/delete_notification.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/widgets/edit/edit_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({required this.notificationModel, super.key});

  final AddNotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w, vertical: 15.h),
        child: Column(
          children: [
            const Spacer(),
            // Title
            NotificationInfo(title: 'Title:', body: notificationModel.title),
            const Spacer(),
            // Body
            NotificationInfo(title: 'Body:', body: notificationModel.body),
            const Spacer(),
            // Date
            NotificationInfo(
              title: 'Create at:',
              body: notificationModel.createdAt.getFormatDayMonthYear(),
            ),
            const Spacer(),
            // Edit Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // delete button
                DeleteNotification(
                  notificationModel: notificationModel,
                ),
                SizedBox(width: 40.w),
                // edit button
                EditNotification(
                  notificationModel: notificationModel,
                ),
                SizedBox(width: 40.w),
                // Send Button
                const Icon(Icons.send, color: DarkColors.blueLight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({required this.title, required this.body, super.key});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            color: Colors.white,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        SizedBox(width: 8.w),
        Flexible(
          child: TextApp(
            text: body,
            theme: context.textStyle.copyWith(
              color: DarkColors.blueLight,
              fontSize: 14.sp,
              fontFamily: FontFamilyHelper.poppinsEnglish,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
        ),
      ],
    );
  }
}
