import 'package:asroo_store/features/customer/home/presentation/widgets/categories/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

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
          itemCount: 8,
          itemBuilder: (context, index) {
            return const CategoryItem(
              image:
                  'https://images.unsplash.com/photo-1749482592769-06ebd3ce7fc8?q=80&w=685&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              title: 'Books',
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
