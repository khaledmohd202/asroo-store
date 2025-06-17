import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/extensions/string_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User Profile Picture.
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
            imageUrl:
                'https://images.unsplash.com/photo-1749482592769-06ebd3ce7fc8?q=80&w=685&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            errorWidget: (context, url, error) {
              return Icon(
                Icons.error_outlined,
                size: 100.h,
                color: Colors.red.shade400,
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        // User Name.
        TextApp(
          text: 'Khaled'.toLowerCase().toCapitalized(),
          theme: context.textStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 5.h),
        // User E-mail.
        TextApp(
          text: 'Khaled@gmail.com',
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
