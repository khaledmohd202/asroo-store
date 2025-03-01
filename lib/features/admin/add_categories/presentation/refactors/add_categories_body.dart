import 'package:asroo_store/core/common/loading/empty_screen.dart';
import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/create/create_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          // Create Category Button
          const CreateCategory(),
          SizedBox(height: 15.h),
          // Category item list
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllAdminCategoriesBloc>().add(
                  const GetAllAdminCategoriesEvent.fetchAdminAllCategories(),
                );
              },
              color: DarkColors.blueLight,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  SliverToBoxAdapter(
                    child: BlocBuilder<
                      GetAllAdminCategoriesBloc,
                      GetAllAdminCategoriesState
                    >(
                      builder: (context, state) {
                        return state.when(
                          success: (list) {
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                return AddCategoryItem(
                                  name:
                                      list.getAllCategoriesList[index].name ??
                                      'MacBook',
                                  categoryId:
                                      list.getAllCategoriesList[index].id ??
                                      '1',
                                  image:
                                      list.getAllCategoriesList[index].image ??
                                      'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjYm9va3xlbnwwfHwwfHx8MA%3D%3D',
                                );
                              },
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 15.h),
                              itemCount: list.getAllCategoriesList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            );
                          },
                          loading: () {
                            return ListView.separated(
                              itemBuilder: (context, index) {
                                return LoadingShimmer(
                                  height: 130.h,
                                  borderRadius: 15.r,
                                );
                              },
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 10.h),
                              itemCount: 4,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
