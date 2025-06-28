import 'package:asroo_store/core/common/widgets/custom_favorite_button.dart';
import 'package:asroo_store/core/common/widgets/custom_share_button.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/customer/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:asroo_store/features/customer/product_details/data/models/product_details_response.dart';
import 'package:asroo_store/features/customer/product_details/presentation/widgets/product_details_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({required this.productDetailsModel, super.key});

  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        top: 10.h,
        left: 20.w,
        right: 20.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Share and Favorite Buttons.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (context, state) {
                    return CustomFavoriteButton(
                      onPressed: () async {
                        await context.read<FavoritesCubit>().manageFavorite(
                          productId: productDetailsModel.id ?? '',
                          title: productDetailsModel.title ?? '',
                          image: productDetailsModel.images.first,
                          price: productDetailsModel.price.toString(),
                          categoryName: productDetailsModel.category!.name,
                        );
                      },
                      size: 25.sp,
                      isFavorite: context.read<FavoritesCubit>().isFavorite(
                        productDetailsModel.id ?? '',
                      ),
                    );
                  },
                ),
                CustomShareButton(size: 30.sp, onPressed: () {}),
              ],
            ),
            SizedBox(height: 10.h),
            ProductDetailsImageSlider(images: productDetailsModel.images),
            SizedBox(height: 30.h),
            TextApp(
              text: productDetailsModel.title ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            SizedBox(height: 15.h),
            TextApp(
              text: productDetailsModel.description ?? '',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
                height: 1.5.h,
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
