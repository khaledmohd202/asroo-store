import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/auth/presentation/widgets/auth_title_info.dart';
import 'package:asroo_store/features/auth/presentation/widgets/dark_and_lang_buttons.dart';
import 'package:asroo_store/features/auth/presentation/widgets/sign_up/sign_up_button.dart';
import 'package:asroo_store/features/auth/presentation/widgets/sign_up/sign_up_text_form.dart';
import 'package:asroo_store/features/auth/presentation/widgets/sign_up/user_avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Dark mode and Language
            const DarkAndLangButtons(),
            SizedBox(height: 30.sp),
            //Welcome Info
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              description: context.translate(LangKeys.signUpWelcome),
            ),
            SizedBox(height: 10.sp),
            //User Avatar Image
            const UserAvatarImage(),
            SizedBox(height: 20.sp),
            // SignUp TextForm
            const SignUpTextForm(),
            SizedBox(height: 20.sp),
            //SignUpButton
            const SignUpButton(),
            SizedBox(height: 10.sp),
            // Go To login Screen
            CustomFadeInRight(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.login);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.bold,
                    color: context.color.bluePinkLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
