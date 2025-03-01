import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/update/update_uploaded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCategoryBottomSheetWidget extends StatefulWidget {
  const UpdateCategoryBottomSheetWidget({super.key});

  @override
  State<UpdateCategoryBottomSheetWidget> createState() =>
      _UpdateCategoryBottomSheetWidgetState();
}

class _UpdateCategoryBottomSheetWidgetState
    extends State<UpdateCategoryBottomSheetWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCategoryController = TextEditingController();

  @override
  void dispose() {
    nameCategoryController.dispose();
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
            // Create Category title
            Center(
              child: TextApp(
                text: 'Update Category',
                theme: context.textStyle.copyWith(
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Update a Photo "Title"
            TextApp(
              text: 'Update a Photo',
              theme: context.textStyle.copyWith(
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 15.h),
            // Update upload Image.
            const UpdateUploadedImage(imageUrl: 'https://plus.unsplash.com/premium_photo-1677587536653-0d02efbb70ee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cXVyYW58ZW58MHx8MHx8fDA%3D' ),
            SizedBox(height: 20.h),
            // Enter the Category Name "Title".
            TextApp(
              text: 'Update the Category Name',
              theme: context.textStyle.copyWith(
                fontFamily: FontFamilyHelper.poppinsEnglish,
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            SizedBox(height: 10.h),
            // Name for "Category TexForm"
            CustomTextField(
              controller: nameCategoryController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Category Name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please selected your Category name.';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            // update a new Category button.
            CustomButton(
              onPressed: () {},
              text: 'Update a new category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              lastRadius: 20.r,
              threeRadius: 20.r,
              textColor: DarkColors.blueDark,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
