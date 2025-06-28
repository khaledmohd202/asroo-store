import 'package:asroo_store/core/common/widgets/custom_product_item.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/customer/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 20.h),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (context.read<FavoritesCubit>().favoritesList.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite  ,
                  color: context.color.textColor,
                  size: 150.w,
                ),
                TextApp(
                  text: 'Choose Your Favorite Products',
                  theme: context.textStyle.copyWith(
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: context.read<FavoritesCubit>().favoritesList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // number of Cols.
              crossAxisSpacing: 13.h, // spacing between cols.
              mainAxisSpacing: 15.w, // spacing between rows.
              childAspectRatio: 165 / 250,
            ),
            itemBuilder: (context, index) {
              final productsList = context.read<FavoritesCubit>().favoritesList;
              return CustomProductItem(
                categoryName: productsList[index].categoryName,
                title: productsList[index].title,
                price: double.parse(productsList[index].price),
                imageUrl: productsList[index].image,
                productId: int.parse(productsList[index].id),
              );
            },
          );
        },
      ),
    );
  }
}
