import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:asroo_store/features/admin/dashboard/presentation/widgets/dashboard_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductsNumberBloc>().add(
            const ProductsNumberEvent.getProductsNumber(),
          );

          context.read<CategoriesNumberBloc>().add(
            const CategoriesNumberEvent.getCategoriesNumber(),
          );

          context.read<UsersNumberBloc>().add(
            const UsersNumberEvent.getUsersNumber(),
          );
        },
        child: ListView(
          children: [
            // Products
            BlocBuilder<ProductsNumberBloc, ProductsNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Products',
                      image: AppImages.productsDrawer,
                      number: '',
                      isLoading: true,
                    );
                  },
                  success: (productNumber) {
                    return DashboardContainer(
                      title: 'Products',
                      image: AppImages.productsDrawer,
                      number: productNumber,
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
            // Categories
            BlocBuilder<CategoriesNumberBloc, CategoriesNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Categories',
                      image: AppImages.categoriesDrawer,
                      number: '',
                      isLoading: true,
                    );
                  },
                  success: (categoriesNumber) {
                    return DashboardContainer(
                      title: 'Categories',
                      image: AppImages.categoriesDrawer,
                      number: categoriesNumber,
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
            // Users
            BlocBuilder<UsersNumberBloc, UsersNumberState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      title: 'Users',
                      image: AppImages.usersDrawer,
                      number: '',
                      isLoading: true,
                    );
                  },
                  success: (usersNumber) {
                    return DashboardContainer(
                      title: 'Users',
                      image: AppImages.usersDrawer,
                      number: usersNumber,
                      isLoading: false,
                    );
                  },
                  error: (errorMessage) {
                    return TextApp(
                      text: errorMessage,
                      theme: context.textStyle.copyWith(
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
