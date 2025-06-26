import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:flutter/material.dart';

class ProductsViewAll extends StatelessWidget {
  const ProductsViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomerAppBar(title: context.translate(LangKeys.viewAll)),
    );
  }
}
