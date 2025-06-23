import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_linear_button.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({required this.price, super.key});

  final double price;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Container(
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.color.containerShadow1,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: '\$ $price',
                theme: context.textStyle.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.bold,
                  color: context.color.bluePinkLight,
                ),
              ),
              CustomLinearButton(
                onPressed: () {},
                height: 40.h,
                width: 140.w,
                child: TextApp(
                  text: 'Add to Cart',
                  theme: context.textStyle.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
