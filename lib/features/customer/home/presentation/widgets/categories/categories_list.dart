import 'package:asroo_store/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:asroo_store/features/customer/home/presentation/widgets/categories/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({required this.categoriesList, super.key});

  final List<GetAllCategoriesModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        left: 15.w,
        right: 15.w,
        top: 20.h,
      ),
      child: SizedBox(
        height: 125.h,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              image: categoriesList[index].image ?? '',
              title: categoriesList[index].name ?? '',
            );
          },
          separatorBuilder:
              (context, index) => SizedBox(
                width: 15.w,
              ),
        ),
      ),
    );
  }
}
