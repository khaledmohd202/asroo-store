import 'package:asroo_store/core/common/loading/empty_screen.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/widgets/add_notification_item.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/widgets/create/create_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          // Create Notification Title.
          const CreateNotifications(),
          // Get All Notifications List.
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                SliverToBoxAdapter(
                  child: BlocBuilder<
                    GetAllNotificationAdminBloc,
                    GetAllNotificationAdminState
                  >(
                    builder: (context, state) {
                      return state.when(
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                        success: (notificationList) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return AddNotificationItem(
                                notificationModel: notificationList[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 15.h);
                            },
                            itemCount: notificationList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          );
                        },
                        empty: EmptyScreen.new,
                        error: Text.new,
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
