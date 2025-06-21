import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:asroo_store/features/customer/home/presentation/widgets/products/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
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
          // return LoadingShimmer(
          //   height: 220.h,
          //   width: 165.w,
          // );
          return const ProductItem(
            categoryName: 'Electronics',
            title: 'Phone',
            price: 199.99,
            imageUrl:
                'https://plus.unsplash.com/premium_photo-1680459838836-a8433c8f664e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGhvbmV8ZW58MHx8MHx8fDA%3D',
          );
        },
      ),
    );
  }
}
