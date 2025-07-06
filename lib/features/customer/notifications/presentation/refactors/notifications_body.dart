import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/service/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/utils/app_strings.dart';
import 'package:asroo_store/features/customer/notifications/data/models/notifications_model.dart';
import 'package:asroo_store/features/customer/notifications/presentation/controller/notifications_controller.dart';
import 'package:asroo_store/features/customer/notifications/presentation/widgets/notification_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
      child: StreamBuilder<List<NotificationsModel>>(
        stream: NotificationsController().getNotificationsList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notification_add,
                    color: context.color.textColor,
                    size: 150.sp,
                  ),
                  TextApp(
                    text: "You Don't Have any Notifications Now",
                    theme: context.textStyle.copyWith(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            itemCount: snapshot.data!.length ,
            itemBuilder: (context, index) {
              return NotificationItem(
                body: snapshot.data![index].body,
                title: snapshot.data![index].title,
                isRead: snapshot.data![index].isRead,
                createdAt: snapshot.data![index].createdAt,
                onTapSelected: () async {
                  await FirebaseFirestore.instance
                      .collection(usersCollection)
                      .doc(SharedPref().getInt(PrefKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .update({'is_read': true});

                  if (snapshot.data![index].productId != -1) {
                    if (!context.mounted) return;
                    await context.pushNamed(
                      AppRoutes.productDetails,
                      arguments: snapshot.data![index].productId,
                    );
                  }
                },
                onTapRemoved: () async {
                  await FirebaseFirestore.instance
                      .collection(usersCollection)
                      .doc(SharedPref().getInt(PrefKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .delete();
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
          );
        },
      ),
    );
  }
}
