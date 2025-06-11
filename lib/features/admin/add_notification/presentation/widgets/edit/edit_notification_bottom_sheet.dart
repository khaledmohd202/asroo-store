import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_notification/data/models/add_notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditNotificationBottomSheet extends StatefulWidget {
  const EditNotificationBottomSheet({
    required this.notificationModel,
    super.key,
  });

  final AddNotificationModel notificationModel;

  @override
  State<EditNotificationBottomSheet> createState() =>
      _EditNotificationBottomSheetState();
}

class _EditNotificationBottomSheetState
    extends State<EditNotificationBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.notificationModel.title;
    bodyController.text = widget.notificationModel.body;
    productIdController.text = widget.notificationModel.productId.toString();
  }

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
                text: 'Edit Notifications',
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
                return null;
              },
            ),
            SizedBox(height: 20.h),
            // Add a button to submit the notification.
            CustomButton(
              onPressed: () {
                _validNotification(context);
              },
              backgroundColor: DarkColors.white,
              textColor: DarkColors.blueDark,
              text: 'Edit Notification',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              lastRadius: 15.r,
              threeRadius: 15.r,
            ),
          ],
        ),
      ),
    );
  }

  void _validNotification(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // Title Controller can be empty, so we don't check it.
      widget.notificationModel.title =
          titleController.text.isEmpty
              ? widget.notificationModel.title
              : titleController.text.trim();
      // Body Controller can be empty, so we don't check it.
      widget.notificationModel.body =
          bodyController.text.isEmpty
              ? widget.notificationModel.body
              : bodyController.text.trim();
      // Product ID Controller can be empty, so we don't check it.
      widget.notificationModel.productId =
          productIdController.text.isEmpty
              ? widget.notificationModel.productId
              : int.parse(productIdController.text.trim());

      widget.notificationModel.save();
      context.pop();
    }
  }
}
