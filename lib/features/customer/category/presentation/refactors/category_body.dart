import 'package:asroo_store/core/common/loading/empty_screen.dart';
import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:asroo_store/core/common/widgets/custom_product_item.dart';
import 'package:asroo_store/features/customer/category/presentation/bloc/get_category_products/get_category_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: BlocBuilder<GetCategoryProductsBloc, GetCategoryProductsState>(
        builder: (context, state) {
          return state.when(
            loading: () {
              return GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of Cols.
                  crossAxisSpacing: 13.h, // spacing between cols.
                  mainAxisSpacing: 15.w, // spacing between rows.
                  childAspectRatio: 165 / 250,
                ),
                itemBuilder: (context, index) {
                  return LoadingShimmer(height: 250.h, width: 165.w);
                },
              );
            },
            success: (productsList) {
              return GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: productsList.length > 10 ? 10 : productsList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of Cols.
                  crossAxisSpacing: 13.h, // spacing between cols.
                  mainAxisSpacing: 15.w, // spacing between rows.
                  childAspectRatio: 165 / 250,
                ),
                itemBuilder: (context, index) {
                  return CustomProductItem(
                    categoryName: productsList[index].category!.name ?? '',
                    title: productsList[index].title ?? '',
                    price: productsList[index].price ?? 0,
                    imageUrl: productsList[index].images!.first,
                    productId: int.parse(productsList[index].id ?? '0'),
                  );
                },
              );
            },
            empty: EmptyScreen.new,
            error: Text.new,
          );
        },
      ),
    );
  }
}
