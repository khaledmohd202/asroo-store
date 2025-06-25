import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/common/dialogs/custom_dialog.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/app_localizations.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            SvgPicture.asset(
              AppImages.language,
              //
              // ignore: deprecated_member_use
              color: context.color.textColor,
            ),
            SizedBox(width: 10.w),
            TextApp(
              text: context.translate(LangKeys.languageTitle),
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
                  textBody: context.translate(LangKeys.changeToTheLanguage),
                  textButton1: context.translate(LangKeys.sure),
                  textButton2: context.translate(LangKeys.cancel),
                  onPressed: () {
                    selectLanguagesButton(context: context, cubit: cubit);
                  },
                  isLoading: false,
                );
              },
              child: Row(
                children: [
                  TextApp(
                    text: context.translate(LangKeys.langCode),
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
      },
    );
  }

  void selectLanguagesButton({
    required BuildContext context,
    required AppCubit cubit,
  }) {
    if (AppLocalizations.of(context)!.isEnglishLocale) {
      cubit.toArabic();
    } else {
      cubit.toEnglish();
    }

    context.pop();
  }
}
