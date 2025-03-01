import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/create/category_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateCategoryBottomSheetWidget extends StatefulWidget {
  const CreateCategoryBottomSheetWidget({super.key});

  @override
  State<CreateCategoryBottomSheetWidget> createState() =>
      _CreateCategoryBottomSheetWidgetState();
}

class _CreateCategoryBottomSheetWidgetState
    extends State<CreateCategoryBottomSheetWidget> {
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
                text: 'Create Category',
                theme: context.textStyle.copyWith(
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontSize: 20.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Add a Photo "Title"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Add a Photo',
                  theme: context.textStyle.copyWith(
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                // Remove Image
                CustomButton(
                  onPressed: () {},
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  lastRadius: 10.r,
                  threeRadius: 10.r,
                  text: 'Remove',
                  width: 120.w,
                  height: 35.h,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            // Selected Image and upload Image.
            const CategoryUploadImage(),
            SizedBox(height: 20.h),
            // Enter the Category Name "Title".
            TextApp(
              text: 'Enter the Category Name',
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
            // Create a new Category button.
            CustomButton(
              onPressed: () {},
              text: 'Create a new category',
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
