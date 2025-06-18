import 'package:asroo_store/core/common/dialogs/custom_dialog.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/utils/app_logout.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/screens/add_categories_screen.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/screens/add_notification_screen.dart';
import 'package:asroo_store/features/admin/add_products/presentation/screens/add_products_screens.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:asroo_store/features/admin/users/presentation/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    // Dashboard
    DrawerItemModel(
      page: const DashboardScreen(),
      title: TextApp(
        text: 'Dashboard',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(Icons.dashboard, color: Colors.white),
    ),
    // Categories
    DrawerItemModel(
      page: const AddCategoriesScreen(),
      title: TextApp(
        text: 'Categories',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(Icons.category_outlined, color: Colors.white),
    ),
    // Products
    DrawerItemModel(
      page: const AddProductsScreens(),
      title: TextApp(
        text: 'Products',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(Icons.production_quantity_limits, color: Colors.white),
    ),
    // Users
    DrawerItemModel(
      page: const UsersScreen(),
      title: TextApp(
        text: 'Users',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(Icons.people_alt_rounded, color: Colors.white),
    ),
    // Notification
    DrawerItemModel(
      page: const AddNotificationScreen(),
      title: TextApp(
        text: 'Notifications',
        theme: context.textStyle.copyWith(
          fontSize: 17.sp,
          color: Colors.white,
          fontFamily: FontFamilyHelper.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      icon: const Icon(Icons.notifications_active, color: Colors.white),
    ),
    // Logout
    DrawerItemModel(
      // any screen to complete my implementation.
      // and here we put Login Screen.
      page: const UsersScreen(),
      title: GestureDetector(
        onTap: () {
          CustomDialog.twoButtonDialog(
            context: context,
            textBody: 'Do you want to logout?',
            textButton1: 'Yes',
            textButton2: 'No',
            onPressed: () async {
              await AppLogout().logout();
            },
            isLoading: false,
          );
        },
        child: Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.bold,
            fontSize: 17.sp,
          ),
        ),
      ),
      icon: const Icon(Icons.exit_to_app, color: Colors.white),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.page,
    required this.title,
    required this.icon,
  });

  final Widget page;
  final Widget title;
  final Icon icon;
}
