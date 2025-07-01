import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogOneButton {
  const CustomDialogOneButton._();

  static void oneButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
              child: Center(
                child: TextApp(
                  text: textBody,
                  theme: context.textStyle.copyWith(
                    color: DarkColors.black1,
                    fontSize: 18.sp,
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontWeight: FontWeightHelper.medium,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            actions: [
              SizedBox(height: 10.h, width: 1.w),
              CustomButton(
                backgroundColor: Colors.green,
                onPressed: () {
                  context.pop();
                },
                text: textButton1,
                width: 320.w,
                height: 45.h,
                lastRadius: 10,
                threeRadius: 10,
              ),
            ],
          ),
      barrierDismissible: false,
    );
  }
}
