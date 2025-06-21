import 'package:asroo_store/core/common/loading/empty_screen.dart';
import 'package:asroo_store/core/common/loading/loading_shimmer.dart';
import 'package:asroo_store/core/common/widgets/custom_button.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/features/customer/home/presentation/bloc/bloc/get_all_categories_bloc.dart';
import 'package:asroo_store/features/customer/home/presentation/bloc/get_banners/get_banners_bloc.dart';
import 'package:asroo_store/features/customer/home/presentation/widgets/banner/banner_slider.dart';
import 'package:asroo_store/features/customer/home/presentation/widgets/categories/categories_list.dart';
import 'package:asroo_store/features/customer/home/presentation/widgets/categories/categories_shimmer.dart';
import 'package:asroo_store/features/customer/home/presentation/widgets/products/products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetBannersBloc>().add(const GetBannersEvent.getBanners());
        context.read<GetAllCategoriesBloc>().add(
          const GetAllCategoriesEvent.getCategories(),
        );
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          // Banners.
          SliverToBoxAdapter(
            child: BlocBuilder<GetBannersBloc, GetBannersState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LoadingShimmer(
                        height: 160.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                  success: (imageBannerList) {
                    return BannerSlider(imageBannerList: imageBannerList);
                  },
                  empty: SizedBox.shrink,
                  error: Text.new,
                );
              },
            ),
          ),
          // Categories.
          SliverToBoxAdapter(
            child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const CategoriesShimmer();
                  },
                  success: (categoriesList) {
                    return CategoriesList(
                      categoriesList: categoriesList,
                    );
                  },
                  empty: EmptyScreen.new,
                  error: Text.new,
                );
              },
            ),
          ),
          // Products.
          const SliverToBoxAdapter(
            child: ProductsList(),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          // Get All Products.
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomButton(
                onPressed: () {},
                text: context.translate(LangKeys.viewAll),
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                lastRadius: 10.r,
                threeRadius: 10.r,
                backgroundColor: context.color.bluePinkLight,
                textColor: Colors.black,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
        ],
      ),
    );
  }
}
