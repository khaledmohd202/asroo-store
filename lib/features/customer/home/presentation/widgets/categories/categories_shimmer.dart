import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 20.h),
      child: SizedBox(
        height: 125.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                LoadingShimmer(
                  height: 75.h,
                  width: 75.w,
                  borderRadius: 15.r,
                ),
                SizedBox(height: 10.h),
                LoadingShimmer(
                  height: 20.h,
                  width: 75.w,
                  borderRadius: 10.r,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 15.w),
        ),
      ),
    );
  }
}
