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
        slivers: [
          // Banners.
          SliverToBoxAdapter(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  height: 50.h,
                  width: 400.w,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
              itemCount: 33,
            ),
          ),
          // Categories.

          // Products.
        ],
      ),
    );
  }
}
