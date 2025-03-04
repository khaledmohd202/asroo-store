import 'package:asroo_store/core/app/upload_image/cubit/cubit/upload_image_cubit.dart';
import 'package:asroo_store/core/common/toast/show_toast.dart';
import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/common/widgets/custom_drop_down.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:asroo_store/features/admin/add_products/data/models/update_product_request_body.dart';
import 'package:asroo_store/features/admin/add_products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:asroo_store/features/admin/add_products/presentation/widgets/update/update_image_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProductBottomSheetWidget extends StatefulWidget {
  const UpdateProductBottomSheetWidget({
    required this.imageList,
    required this.categoryName,
    required this.title,
    required this.price,
    required this.description,
    required this.productId,
    required this.categoryId,
    super.key,
  });
  final List<String> imageList;
  final String categoryName;
  final String title;
  final String price;
  final String description;
  final String productId;
  final String categoryId;

  @override
  State<UpdateProductBottomSheetWidget> createState() =>
      _UpdateProductBottomSheetWidgetState();
}

class _UpdateProductBottomSheetWidgetState
    extends State<UpdateProductBottomSheetWidget> {
  final _formKey = GlobalKey<FormState>();


  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? categoryValueName;
  double? categoryValueId;

  @override
  void initState() {
    super.initState();

    categoryValueName = widget.categoryName;
    categoryValueId = double.parse(widget.categoryId);
    _titleController.text = widget.title;
    _priceController.text = widget.price;
    _descriptionController.text = widget.description;
  }

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
              // Update Product title
              Center(
                child: TextApp(
                  text: 'Update Product',
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
                text: 'Update a Photos',
                theme: context.textStyle.copyWith(
                  fontFamily: FontFamilyHelper.poppinsEnglish,
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              SizedBox(height: 15.h),
              // Update Image Product.
              UpdateImageProduct(imageList: widget.imageList),
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
              // Price
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
              // Description
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
              // Category
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
                        hintText: '',
                        onChanged: (value) {
                          setState(() {
                            categoryValueName = value;

                            final categoryIdString =
                                categoryModel
                                .getAllCategoriesList
                                .firstWhere((e) => e.name == value)
                                .id!;
                            categoryValueId = double.parse(categoryIdString);
                          });
                        },
                        value: categoryValueName,
                      );
                    },
                    orElse: () {
                      return CustomDropDown(
                        items: const [],
                        hintText: '',
                        onChanged: (value) {},
                        value: '',
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 15.h),
              // Update Product Button.
              BlocConsumer<UpdateProductBloc, UpdateProductState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: () {
                      context.pop();

                      ShowToast.showToastSuccessTop(
                        message: '${_titleController.text} Updated.',
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
                    success: () {
                      return Container(
                        height: 50.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
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
                          _validUpdateProductButton(context);
                        },
                        text: 'Update Product',
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

  void _validUpdateProductButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // Update Category
      context.read<UpdateProductBloc>().add(
        UpdateProductEvent.updateProduct(
          body: UpdateProductRequestBody(
            title: _titleController.text.trim(),
            price: double.parse(_priceController.text.trim()),
            imageList:
                context.read<UploadImageCubit>().updateImageList.isEmpty
                    ? widget.imageList
                    : context.read<UploadImageCubit>().updateImageList,
            description: _descriptionController.text.trim(),
            categoryId: categoryValueId ?? 0,
            productId: widget.productId,
          ),
        ),
      );
    }
  }
}
