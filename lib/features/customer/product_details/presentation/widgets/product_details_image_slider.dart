import 'package:asroo_store/core/common/animations/animate_do.dart';
// import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsImageSlider extends StatefulWidget {
  const ProductDetailsImageSlider({super.key});

  @override
  State<ProductDetailsImageSlider> createState() =>
      _ProductDetailsImageSliderState();
}

class _ProductDetailsImageSliderState extends State<ProductDetailsImageSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 500,
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 250.h,
              reverse: true,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                activeIndex = index;
                setState(() {});
              },
            ),
            itemCount: 1,
            itemBuilder: (context, index, realIndex) {
              return CachedNetworkImage(
                // imageUrl: widget.imageBannerList[index].imageProductFormat(),
                imageUrl:
                    'https://images.unsplash.com/photo-1743601567013-b72682fdc511?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyfHx8ZW58MHx8fHx8',
                fit: BoxFit.fill,
                placeholder: (context, url) => const SizedBox.shrink(),
                errorWidget:
                    (context, url, error) => Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 40.h,
                    ),
              );
            },
          ),
          SizedBox(height: 10.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children:
          //       widget.imageBannerList.asMap().entries.map((entry) {
          //         return Container(
          //           width: 15.w,
          //           height: 4.h,
          //           margin: EdgeInsets.symmetric(horizontal: 3.w),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10.r),
          //             color:
          //                 activeIndex == entry.key
          //                     ? context.color.bluePinkLight
          //                     : Colors.grey,
          //           ),
          //         );
          //       }).toList(),
          // ),
        ],
      ),
    );
  }
}
