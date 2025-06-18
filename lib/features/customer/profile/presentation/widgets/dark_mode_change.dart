import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DarkModeChange extends StatelessWidget {
  const DarkModeChange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return Row(
      children: [
        SvgPicture.asset(AppImages.darkMode, color: context.color.textColor),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.darkMode),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),
        // Radio Button.
        Transform.scale(
          scale: 0.80,
          child: Switch.adaptive(
            dragStartBehavior: DragStartBehavior.down,
            value: cubit.isDark,
            inactiveTrackColor: Colors.green,
            activeColor: const Color(0xff262626),
            inactiveThumbColor: Colors.white,
            onChanged: (value) {
              cubit.changeAppThemeMode();
            },
          ),
        ),
      ],
    );
  }
}
