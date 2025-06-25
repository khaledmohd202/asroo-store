import 'package:asroo_store/core/common/widgets/custom_product_item.dart';
import 'package:asroo_store/features/admin/add_products/data/models/get_all_product_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({required this.productsList, super.key});

  final List<GetAllProductModel> productsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productsList.length > 10 ? 10 : productsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of Cols.
          crossAxisSpacing: 13.h, // spacing between cols.
          mainAxisSpacing: 15.w, // spacing between rows.
          childAspectRatio: 165 / 250,
        ),
        itemBuilder: (context, index) {
          return CustomProductItem(
            categoryName: productsList[index].category!.name ?? '',
            title: productsList[index].title ?? '',
            price: productsList[index].price ?? 0,
            imageUrl: productsList[index].images!.first,
            productId: int.parse(productsList[index].id ?? '0'),
          );
        },
      ),
    );
  }
}
