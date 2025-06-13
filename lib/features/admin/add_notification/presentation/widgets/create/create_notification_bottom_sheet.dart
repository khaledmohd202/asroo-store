import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNotificationBottomSheet extends StatefulWidget {
  const CreateNotificationBottomSheet({super.key});

  @override
  State<CreateNotificationBottomSheet> createState() =>
      _CreateNotificationBottomSheetState();
}

class _CreateNotificationBottomSheetState
    extends State<CreateNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    productIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: 'Add Notifications',
                theme: context.textStyle.copyWith(
                  fontSize: 20.sp,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Notification Title',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: titleController,
              hintText: 'Title',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Title must be at least 2 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Notification Body',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: bodyController,
              hintText: 'Body',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Title must be at least 2 characters long';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            TextApp(
              text: 'Product ID "optional"',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: productIdController,
              hintText: 'Product ID',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid Product ID';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            // Add a button to submit the notification.
            BlocConsumer<AddNotificationBloc, AddNotificationState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      message: 'Notification created successfully',
                    );
                  },
                  error: (message) {
                    ShowToast.showToastErrorTop(message: message);
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validNotification(context);
                      },
                      backgroundColor: DarkColors.white,
                      textColor: DarkColors.blueDark,
                      text: 'Add Notification',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      lastRadius: 15.r,
                      threeRadius: 15.r,
                    );
                  },
                  loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: DarkColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: DarkColors.blueDark,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AddNotificationBloc>().add(
        AddNotificationEvent.createNotification(
          notificationModel: AddNotificationModel(
            title: titleController.text.trim(),
            body: bodyController.text.trim(),
            productId: int.parse(productIdController.text.trim()),
            createdAt: DateTime.now(),
          ),
        ),
      );
    }
  }
}
