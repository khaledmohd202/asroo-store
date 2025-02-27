import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/widgets/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: const [
            // Products
            DashboardContainer(
              title: 'Products',
              image: AppImages.productsDrawer,
              number: '0',
              isLoading: false,
            ),
            // Categories
            DashboardContainer(
              title: 'Categories',
              image: AppImages.categoriesDrawer,
              number: '0',
              isLoading: false,
            ),
            // Users
            DashboardContainer(
              title: 'Users',
              image: AppImages.usersDrawer,
              number: '0',
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
