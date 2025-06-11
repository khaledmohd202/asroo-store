import 'package:asroo_store/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/widgets/create/create_notification_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNotifications extends StatelessWidget {
  const CreateNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: 'Notifications',
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontFamily: FontFamilyHelper.poppinsEnglish,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: BlocProvider(
                create: (context) => sl<AddNotificationBloc>(),
                child: const CreateNotificationBottomSheet(),
              ),
              backgroundColor: DarkColors.blueDark,
            );
          },
          text: 'Add',
          width: 90.w,
          height: 35.h,
          lastRadius: 10.r,
          threeRadius: 10.r,
          backgroundColor: DarkColors.blueDark,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
