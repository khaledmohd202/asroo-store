import 'package:asroo_store/features/customer/home/presentation/widgets/banner/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({required this.scrollController, super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        controller: scrollController,
        slivers: const [
          // Banners.
          SliverToBoxAdapter(
            child: BannerSlider(),
          ),
          // Categories.

          // Products.
        ],
      ),
    );
  }
}
