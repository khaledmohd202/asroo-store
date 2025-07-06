import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
    required this.onTapSelected,
    required this.onTapRemoved,
    super.key,
  });

  final String title;
  final String body;
  final String createdAt;
  final bool isRead;
  final VoidCallback onTapSelected;
  final VoidCallback onTapRemoved;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: onTapSelected,
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            // color: context.color.bluePinkDark!,
            color: Colors.transparent,
            width: 1.5.w,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.notificationIcon,
            height: 35.h,
            width: 35.w,
            fit: BoxFit.cover,
            color: context.color.bluePinkLight,
            // color: Colors.pink,
          ),
        ),
      ),
      title: TextApp(
        text: title,
        theme: context.textStyle.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeightHelper.medium,
          color: Colors.white,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          // Body.
          TextApp(
            text: body,
            theme: context.textStyle.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeightHelper.regular,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 5.h),
          // Created at.
          TextApp(
            text: createdAt,
            theme: context.textStyle.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeightHelper.regular,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 5.h),
          Divider(
            // color: context.color.bluePinkLight,
            color: isRead ? Colors.grey : Colors.white,
            height: 1.h,
          ),
        ],
      ),
      trailing: Padding(
        padding: EdgeInsets.only(top: 15.h, right: 10.w),
        child: GestureDetector(
          onTap: onTapRemoved,
          child: Icon(
            Icons.close,
            color: Colors.white70,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
