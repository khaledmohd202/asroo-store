import 'package:asroo_store/core/app/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/create/category_upload_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                BlocBuilder<UploadImageCubit, UploadImageState>(
                  builder: (context, state) {
                    if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return CustomButton(
                      onPressed: () {
                        context.read<UploadImageCubit>().removeImage();
                      },
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      lastRadius: 10.r,
                      threeRadius: 10.r,
                      text: 'Remove',
                      width: 120.w,
                      height: 35.h,
                    );
                  },
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
            BlocConsumer<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    context.pop();
                    ShowToast.showToastSuccessTop(
                      message: '${nameCategoryController.text} Created Success',
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
                  orElse: () {
                    return CustomButton(
                      onPressed: () {
                        _validCreateCategory(context);
                      },
                      text: 'Create a new category',
                      width: MediaQuery.of(context).size.width,
                      height: 50.h,
                      lastRadius: 20.r,
                      threeRadius: 20.r,
                      textColor: DarkColors.blueDark,
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

  void _validCreateCategory(BuildContext context) {
    if (formKey.currentState!.validate() ||
        context.read<UploadImageCubit>().getImageUrl.isEmpty) {
      if (context.read<UploadImageCubit>().getImageUrl.isEmpty) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      } else {
        // Send Category
        context.read<CreateCategoryBloc>().add(
          CreateCategoryEvent.createNewCategory(
            body: CreateCategoryRequestBody(
              name: nameCategoryController.text.trim(),
              image: context.read<UploadImageCubit>().getImageUrl,
            ),
          ),
        );
      }
    }
  }
}
