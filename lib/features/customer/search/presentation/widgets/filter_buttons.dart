import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/enum/filter_button_enum.dart';
import 'package:asroo_store/features/customer/search/data/model/search_request_body.dart';
import 'package:asroo_store/features/customer/search/presentation/bloc/search/search_bloc.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/save_filter_button.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/search_for_data_icon.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/search_name_price_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceMinController = TextEditingController();
  final TextEditingController priceMaxController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    priceMinController.dispose();
    priceMaxController.dispose();
    // Dispose of the controllers to free up resources
    super.dispose();
  }

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
                controller: nameController,
                hintText: 'Search for products name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a product name';
                  }
                  return null;
                },
              ),
            ),
            SaveFilterButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<SearchBloc>().add(
                    SearchEvent.searchForProduct(
                      body: SearchRequestBody(
                        searchName: nameController.text.trim(),
                      ),
                    ),
                  );

                  setState(() {
                    searchEnum = FilterButtonEnum.saved;
                  });
                }
              },
            ),
          ] else if (searchEnum == FilterButtonEnum.price) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: priceMinController,
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
                      controller: priceMaxController,
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
            SaveFilterButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Call API for price search
                  context.read<SearchBloc>().add(
                    SearchEvent.searchForProduct(
                      body: SearchRequestBody(
                        priceMin: int.parse(priceMinController.text.trim()),
                        priceMax: int.parse(priceMaxController.text.trim()),
                      ),
                    ),
                  );
                  setState(() {
                    searchEnum = FilterButtonEnum.saved;
                  });
                }
              },
            ),
          ],
          if (searchEnum == FilterButtonEnum.none) ...[
            SizedBox(height: 180.h),
            const SearchForDataIcon(),
          ],
        ],
      ),
    );
  }

  void priceSearchTap() {
    if (searchEnum == FilterButtonEnum.price) {
      setState(() {
        searchEnum = FilterButtonEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.price;
      });
    }

    priceMaxController.clear();
    priceMinController.clear();
  }

  void nameSearchTap() {
    if (searchEnum == FilterButtonEnum.name) {
      setState(() {
        searchEnum = FilterButtonEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.name;
      });
    }
    nameController.clear();
  }
}
