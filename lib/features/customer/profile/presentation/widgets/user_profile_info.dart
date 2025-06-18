import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/extensions/string_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/auth/data/models/user_role_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({required this.userInfo, super.key});

  final UserRoleResponse userInfo;

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
            imageUrl: userInfo.userImage!,
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
          text: userInfo.userName!.toLowerCase().toCapitalized(),
          theme: context.textStyle.copyWith(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        SizedBox(height: 5.h),
        // User E-mail.
        TextApp(
          text: userInfo.userEmail!,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }
}
