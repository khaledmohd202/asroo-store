import 'package:asroo_store/core/app/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_drop_down.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:asroo_store/features/admin/add_products/data/models/create_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/widgets/create/create_product_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateProductBottomSheetWidget extends StatefulWidget {
  const CreateProductBottomSheetWidget({super.key});

  @override
  State<CreateProductBottomSheetWidget> createState() =>
      _CreateProductBottomSheetWidgetState();
}

class _CreateProductBottomSheetWidgetState
    extends State<CreateProductBottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? categoryName;
  double? categoryId;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Create Product title
              Center(
                child: TextApp(
                  text: 'Create Product',
                  theme: context.textStyle.copyWith(
                    fontFamily: FontFamilyHelper.poppinsEnglish,
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // Add a Photo "Title"
              TextApp(
                text: 'Adding Photos',
                theme: context.textStyle.copyWith(
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              SizedBox(height: 15.h),
              // Add a Photo Product.
              const CreateImageProduct(),
              SizedBox(height: 20.h),
              // Enter the Product Name "Title".
              TextApp(
                text: 'Title',
                theme: context.textStyle.copyWith(
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              SizedBox(height: 10.h),
              // Title Text Field.
              CustomTextField(
                controller: _titleController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please selected your Product Title.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              // Price title.
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              SizedBox(height: 10.h),
              // Price.
              CustomTextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                hintText: 'Price',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Selected your Product Price.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              // Description Title.
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              SizedBox(height: 10.h),
              // Description.
              CustomTextField(
                controller: _descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please selected your Product Description.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15.h),
              // Category.
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                ),
              ),
              SizedBox(height: 10.h),
              // Category Drop Down to Choose its Section.
              BlocBuilder<
                GetAllAdminCategoriesBloc,
                GetAllAdminCategoriesState
              >(
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (categoryModel) {
                      return CustomDropDown(
                        items: categoryModel.categoryDropDownList,
                        hintText: 'Select a Category',
                        onChanged: (value) {
                          setState(() {
                            categoryName = value;
                            // to get the 'id' of the category of the product.
                            final categoryIdString =
                                categoryModel.getAllCategoriesList
                                    .firstWhere((e) => e.name == value)
                                    .id!;
                            // and convert it from String to double.
                            categoryId = double.tryParse(categoryIdString);
                          });
                        },
                        value: categoryName,
                      );
                    },
                    orElse: () {
                      return CustomDropDown(
                        items: const [''],
                        hintText: 'Select a Category',
                        onChanged: (value) {},
                        value: '',
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 15.h),
              // Create Product Button.
              BlocConsumer<CreateProductBloc, CreateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      context.pop();

                      ShowToast.showToastSuccessTop(
                        message: '${_titleController.text} Created.',
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
                          color: DarkColors.blueDark,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
                      );
                    },
                    orElse: () {
                      return CustomButton(
                        onPressed: () {
                          _validCreateProductButton(context);
                        },
                        text: 'Create Product',
                        width: MediaQuery.of(context).size.width,
                        height: 50.h,
                        lastRadius: 20.r,
                        threeRadius: 20.r,
                        backgroundColor: Colors.white,
                        textColor: DarkColors.blueDark,
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 15.h),
            ],
          ),
        ),
      ),
    );
  }

  void _validCreateProductButton(BuildContext context) {
    final indexEmptyImage = context
        .read<UploadImageCubit>()
        .imageList
        .indexWhere((e) => e.isNotEmpty);

    if (_formKey.currentState!.validate() ||
        indexEmptyImage == -1 ||
        categoryName == null) {
      if (indexEmptyImage == -1) {
        ShowToast.showToastErrorTop(
          message: context.translate(LangKeys.validPickImage),
        );
      } else if (categoryName == null) {
        ShowToast.showToastErrorTop(message: 'Please Select Your Category.');
      } else {
        context.read<CreateProductBloc>().add(
          CreateProductEvent.createNewProduct(
            body: CreateProductRequestBody(
              title: _titleController.text.trim(),
              price: double.parse(_priceController.text.trim()),
              description: _descriptionController.text.trim(),
              categoryId: categoryId ?? 0,
              imageList: context.read<UploadImageCubit>().imageList,
            ),
          ),
        );
      }
    }
  }
}
