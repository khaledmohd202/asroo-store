import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendNotification extends StatelessWidget {
  const SendNotification({
    required this.notificationModel,
    required this.indexId,
    super.key,
  });

  final AddNotificationModel notificationModel;
  final int indexId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendNotificationBloc, SendNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showToastSuccessTop(
              message: 'Notification sent successfully',
            );
          },
          error: (error) {
            ShowToast.showToastErrorTop(
              message: error,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (index) {
            if (indexId == index) {
              return SizedBox(
                height: 25.h,
                width: 25.w,
                child: const CircularProgressIndicator(color: Colors.white),
              );
            }
            return const Icon(Icons.send_rounded, color: DarkColors.blueLight);
          },
          orElse: () {
            return InkWell(
              onTap: () {
                context.read<SendNotificationBloc>().add(
                  SendNotificationEvent.sendNotifications(
                    title: notificationModel.title,
                    body: notificationModel.body,
                    productId: notificationModel.productId,
                    indexId: indexId,
                  ),
                );
              },
              child: const Icon(Icons.send, color: DarkColors.blueLight),
            );
          },
        );
      },
    );
  }
}
