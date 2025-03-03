import 'package:asroo_store/features/admin/add_products/presentation/widgets/add_product_item.dart';
import 'package:asroo_store/features/admin/add_products/presentation/widgets/create/create_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductsBody extends StatelessWidget {
  const AddProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          // Add Products Button.
          const CreateProduct(),
          // Get All Products.
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of Cols.
                        crossAxisSpacing: 13.h, // spacing between cols.
                        mainAxisSpacing: 15.w, // spacing between rows.
                        childAspectRatio: 165 / 250,
                      ),
                      itemBuilder: (context, index) {
                        return const AddProductItem(
                          imageUrl:
                              'https://plus.unsplash.com/premium_photo-1676929390422-ff50ebed07ec?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          title: 'Quran',
                          categoryName: 'Mushaf Sharif',
                          price: '1200',
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
