import 'package:asroo_store/core/common/widgets/customer_app_bar.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/features/customer/product_details/presentation/bloc/product_details/product_details_bloc.dart';
import 'package:asroo_store/features/customer/product_details/presentation/refactors/add_to_cart_button.dart';
import 'package:asroo_store/features/customer/product_details/presentation/refactors/product_details_body.dart';
import 'package:asroo_store/features/customer/product_details/presentation/refactors/product_details_custom_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({required this.productId, super.key});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductDetailsBloc>()..add(
        GetProductDetailsEvent(productId: productId),
      ),
      child: Scaffold(
        appBar: const CustomerAppBar(title: 'Product Details'),
        bottomNavigationBar: const AddToCartButton(price: 150),
        body: Stack(
          children: [
            CustomPaint(
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height,
              ),
              painter: ProductDetailsCustomPainter(
                gradient: LinearGradient(
                  colors: [
                    context.color.bluePinkLight!,
                    context.color.bluePinkDark!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            const ProductDetailsBody(),
          ],
        ),
      ),
    );
  }
}
