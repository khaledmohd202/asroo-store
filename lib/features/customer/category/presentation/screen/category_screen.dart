import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/features/customer/category/presentation/bloc/get_category_products/get_category_products_bloc.dart';
import 'package:asroo_store/features/customer/category/presentation/refactors/category_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.categoryInfo, super.key});

  final ({String categoryName, int categoryId}) categoryInfo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<GetCategoryProductsBloc>()..add(
                FetchCategoryProductsEvent(categoryId: categoryInfo.categoryId),
              ),
      child: Scaffold(
        appBar: CustomerAppBar(title: categoryInfo.categoryName),
        body: const CategoryBody(),
      ),
    );
  }
}
