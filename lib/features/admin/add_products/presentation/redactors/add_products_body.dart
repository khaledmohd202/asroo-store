import 'package:asroo_store/core/common/loading/empty_screen.dart';
import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/widgets/add_product_item.dart';
import 'package:asroo_store/features/admin/add_products/presentation/widgets/create/create_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductsBody extends StatelessWidget {
  const AddProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          // Add Products Button.
          const CreateProduct(),
          // Get All Products.
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllAdminProductsBloc>().add(
                  const GetAllAdminProductsEvent.fetchAdminAllProducts(
                    isNotLoading: true,
                  ),
                );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: BlocBuilder<
                      GetAllAdminProductsBloc,
                      GetAllAdminProductsState
                    >(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // number of Cols.
                                    crossAxisSpacing:
                                        13.h, // spacing between cols.
                                    mainAxisSpacing:
                                        15.w, // spacing between rows.
                                    childAspectRatio: 165 / 250,
                                  ),
                              itemBuilder: (context, index) {
                                return LoadingShimmer(
                                  height: 220.h,
                                  width: 165.w,
                                );
                              },
                            );
                          },
                          success: (list) {
                            return GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: list.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // number of Cols.
                                    crossAxisSpacing:
                                        13.h, // spacing between cols.
                                    mainAxisSpacing:
                                        15.w, // spacing between rows.
                                    childAspectRatio: 165 / 250,
                                  ),
                              itemBuilder: (context, index) {
                                return AddProductItem(
                                  imageUrl: list[index].images!.first,
                                  title: list[index].title!,
                                  categoryName:
                                      list[index].category!.name ?? '',
                                  price: list[index].price!.toString(),
                                  productId: list[index].id!,
                                );
                              },
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
          ),
        ],
      ),
    );
  }
}
