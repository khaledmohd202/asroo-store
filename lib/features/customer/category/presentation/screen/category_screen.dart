import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/features/customer/category/presentation/refactors/category_body.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.categoryInfo, super.key});

  final ({String categoryName, int categoryId}) categoryInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(title: categoryInfo.categoryName),
      body: const CategoryBody(),
    );
  }
}
