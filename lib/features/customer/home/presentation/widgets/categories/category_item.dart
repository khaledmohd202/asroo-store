import 'package:asroo_store/core/common/widgets/custom_container_linear_customer.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.image, required this.title, super.key});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.
        CustomContainerLinearCustomer(
          height: 75.h,
          width: 75.w,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              height: 75.h,
              width: 75.w,
              errorWidget:
                  (context, url, error) => Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 30.h,
                  ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 35.h,
          width: 75.w,
          child: TextApp(
            text: title,
            textAlign: TextAlign.center,
            theme: context.textStyle.copyWith(
              fontWeight: FontWeightHelper.bold,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
