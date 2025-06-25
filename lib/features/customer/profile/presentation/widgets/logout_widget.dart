import 'package:asroo_store/core/common/dialogs/custom_dialog.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/core/utils/app_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppImages.logout,
          //
          // ignore: deprecated_member_use
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.logOut),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        // Language Button.
        InkWell(
          onTap: () {
            // Dialogue.
            CustomDialog.twoButtonDialog(
              context: context,
              textBody: context.translate(LangKeys.logOutFromApp),
              textButton1: context.translate(LangKeys.yes),
              textButton2: context.translate(LangKeys.no),
              onPressed: () async{
                await AppLogout().logout();
              },
              isLoading: false,
            );
          },
          child: Row(
            children: [
              TextApp(
                text: context.translate(LangKeys.logOut).toLowerCase(),
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                color: context.color.textColor,
                size: 15.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
