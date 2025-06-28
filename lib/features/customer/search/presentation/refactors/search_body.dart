import 'package:asroo_store/core/common/loading/empty_screen.dart';
import 'package:asroo_store/core/common/widgets/custom_product_item.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/features/customer/search/presentation/bloc/search/search_bloc.dart';
import 'package:asroo_store/features/customer/search/presentation/widgets/filter_buttons.dart';
// import 'package:asroo_store/features/customer/search/presentation/widgets/search_for_data_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          // Filter Buttons.
          const FilterButtons(),
          SizedBox(height: 10.h),

          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  return const SizedBox.shrink();
                },
                loading: () {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: context.color.textColor,
                      ),
                    ),
                  );
                },
                success: (productsList) {
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: productsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // number of Cols.
                        crossAxisSpacing: 13.h, // spacing between cols.
                        mainAxisSpacing: 15.w, // spacing between rows.
                        childAspectRatio: 165 / 250,
                      ),
                      itemBuilder: (context, index) {
                        return CustomProductItem(
                          categoryName:
                              productsList[index].category!.name ?? '',
                          title: productsList[index].title ?? '',
                          price: productsList[index].price ?? 0,
                          imageUrl: productsList[index].images!.first,
                          productId: int.parse(
                            productsList[index].id ?? '0',
                          ),
                        );
                      },
                    ),
                  );
                },
                empty: EmptyScreen.new,
                error: Text.new,
              );
            },
          ),
        ],
      ),
    );
  }
}
