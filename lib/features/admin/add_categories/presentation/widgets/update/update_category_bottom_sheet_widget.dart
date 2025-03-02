import 'package:asroo_store/core/app/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/update/update_uploaded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateCategoryBottomSheetWidget extends StatefulWidget {
  const UpdateCategoryBottomSheetWidget({
    required this.imageUrl,
    required this.categoryID,
    required this.categoryName,
    super.key,
  });

  final String imageUrl;
  final String categoryID;
  final String categoryName;

  @override
  State<UpdateCategoryBottomSheetWidget> createState() =>
      _UpdateCategoryBottomSheetWidgetState();
}

class _UpdateCategoryBottomSheetWidgetState
    extends State<UpdateCategoryBottomSheetWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameCategoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameCategoryController.text = widget.categoryName;
  }

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
            UpdateUploadedImage(
              imageUrl: widget.imageUrl,
              // 'https://plus.unsplash.com/premium_photo-1677587536653-0d02efbb70ee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cXVyYW58ZW58MHx8MHx8fDA%3D',
            ),
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
            BlocConsumer<UpdateCategoryBloc, UpdateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      message: '${nameCategoryController.text} Update Success.',
                      seconds: 2,
                    );
                  },
                  error: (error) {
                    ShowToast.showToastErrorTop(message: error);
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validUpdateCategory(context);
                      },
                      text: 'Update a new category',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      lastRadius: 20.r,
                      threeRadius: 20.r,
                      textColor: DarkColors.blueDark,
                    );
                  },
                  loading: () {
                    return Container(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }

  void _validUpdateCategory(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<UpdateCategoryBloc>().add(
        UpdateCategoryEvent.updateCategory(
          body: UpdateCategoryRequestBody(
            image:
                context.read<UploadImageCubit>().getImageUrl.isEmpty
                    ? widget.imageUrl
                    : context.read<UploadImageCubit>().getImageUrl,
            name: nameCategoryController.text.trim(),
            id: widget.categoryID,
          ),
        ),
      );
    }
  }
}
