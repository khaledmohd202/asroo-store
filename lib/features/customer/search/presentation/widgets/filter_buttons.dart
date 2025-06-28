import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/save_filter_button.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/search_name_price_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Buttons
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'Search Name',
                  onTap: () {},
                  isSelected: true,
                ),
              ),
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'Search Price',
                  onTap: () {},
                  isSelected: true,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          // Search Text field.
          CustomFadeInDown(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: 'Search for products name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a product name';
                }
                return null;
              },
            ),
          ),
          SaveFilterButton(onPressed: () {}),
        ],
      ),
    );
  }
}
