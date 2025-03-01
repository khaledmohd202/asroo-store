import 'package:asroo_store/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:asroo_store/features/admin/add_categories/presentation/widgets/create/create_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          // Create Category Button
          CreateCategory(),
          SizedBox(height: 15.h),

          // Category item list
          AddCategoryItem(
            name: 'MacBook',
            categoryId: '1',
            image:
                'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjYm9va3xlbnwwfHwwfHx8MA%3D%3D',
          ),
        ],
      ),
    );
  }
}
