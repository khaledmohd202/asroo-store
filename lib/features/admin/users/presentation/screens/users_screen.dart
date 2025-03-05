import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/users/presentation/refactors/users_body.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DarkColors.mainColor,
      appBar: AdminAppBar(
        title: 'Users',
        backgroundColor: DarkColors.mainColor,
        isMain: true,
      ),
      body: UsersBody(),
    );
  }
}
