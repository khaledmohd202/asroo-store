import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/features/customer/products_view_all/presentation/bloc/products_view_all/products_view_all_bloc.dart';
import 'package:asroo_store/features/customer/products_view_all/presentation/bloc/products_view_all/products_view_all_event.dart';
import 'package:asroo_store/features/customer/products_view_all/presentation/refactors/products_view_all_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsViewAll extends StatelessWidget {
  const ProductsViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<ProductsViewAllBloc>()..add(const GetProductsViewAllEvent()),
      child: Scaffold(
        appBar: CustomerAppBar(title: context.translate(LangKeys.viewAll)),
        body: const ProductsViewAllBody(),
      ),
    );
  }
}
