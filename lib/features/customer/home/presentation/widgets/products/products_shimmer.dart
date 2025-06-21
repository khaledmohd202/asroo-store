import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsShimmer extends StatelessWidget {
  const ProductsShimmer({super.key});

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
          return LoadingShimmer(
            height: 250.h,
            width: 165.w,
          );
        },
      ),
    );
  }
}
