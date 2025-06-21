import 'package:asroo_store/core/common/widgets/custom_container_linear_customer.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/extensions/string_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({required this.imageBannerList, super.key});

  final List<String> imageBannerList;

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: 10.w,
      ),
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 160.h,
              reverse: true,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, reason) {
                activeIndex = index;
                setState(() {});
              },
            ),
            itemCount: widget.imageBannerList.length,
            itemBuilder: (context, index, realIndex) {
              return CustomContainerLinearCustomer(
                height: 16.h,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl:
                        widget.imageBannerList[index].imageProductFormat(),
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget:
                        (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40.h,
                        ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.imageBannerList.asMap().entries.map((entry) {
                  return Container(
                    width: 15.w,
                    height: 4.h,
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color:
                          activeIndex == entry.key
                              ? context.color.bluePinkLight
                              : Colors.grey,
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
