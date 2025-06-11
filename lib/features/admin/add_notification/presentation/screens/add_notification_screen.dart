import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/factors/add_notification_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationScreen extends StatelessWidget {
  const AddNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  GetAllNotificationAdminBloc()..add(
                    const GetAllNotificationAdminEvent.getAllNotification(),
                  ),
        ),
      ],
      child: const Scaffold(
        backgroundColor: DarkColors.mainColor,
        appBar: AdminAppBar(
          title: 'Notifications',
          backgroundColor: DarkColors.mainColor,
          isMain: true,
        ),
        body: AddNotificationBody(),
      ),
    );
  }
}
