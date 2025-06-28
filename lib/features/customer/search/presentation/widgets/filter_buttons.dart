import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/enum/filter_button_enum.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/save_filter_button.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/search_for_data_icon.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/search_name_price_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  FilterButtonEnum searchEnum = FilterButtonEnum.none;

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
                  onTap: nameSearchTap,
                  isSelected: searchEnum == FilterButtonEnum.name,
                ),
              ),
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'Search Price',
                  onTap: priceSearchTap,
                  isSelected: searchEnum == FilterButtonEnum.price,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          if (searchEnum == FilterButtonEnum.name) ...[
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
          ] else if (searchEnum == FilterButtonEnum.price) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Price Min',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Min Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Price Max',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Max Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SaveFilterButton(onPressed: () {}),
          ],
          if (searchEnum == FilterButtonEnum.none) ...[
            SizedBox(height: 200.h),
            const SearchForDataIcon(),
          ],
        ],
      ),
    );
  }

  void priceSearchTap() {
    if (searchEnum == FilterButtonEnum.price) {
      setState(() {
        searchEnum = FilterButtonEnum.none;
        // Call API
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.price;
      });
    }
  }

  void nameSearchTap() {
    if (searchEnum == FilterButtonEnum.name) {
      setState(() {
        searchEnum = FilterButtonEnum.none;
        // Call API
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.name;
      });
    }
  }
}
