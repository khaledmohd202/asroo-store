import 'package:asroo_store/core/common/widgets/admin_app_bar.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/features/admin/add_products/presentation/redactors/add_products_body.dart';
import 'package:flutter/material.dart';

class AddProductsScreens extends StatelessWidget {
  const AddProductsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: DarkColors.mainColor,
      appBar: AdminAppBar(
        title: 'Products',
        backgroundColor: DarkColors.mainColor,
        isMain: true,
      ),
      body: AddProductsBody(),
    );
  }
}
