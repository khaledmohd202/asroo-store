import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/common/widgets/custom_container_linear_customer.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/extensions/string_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsImageSlider extends StatefulWidget {
  const ProductDetailsImageSlider({
    required this.images,
    super.key,
  });

  final List<String> images;

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
            itemCount: widget.images.length,
            itemBuilder: (context, index, realIndex) {
              // return CustomContainerLinearCustomer(
              //   height: 16.h,
              //   width: MediaQuery.of(context).size.width,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(15.r),
              //     child: CachedNetworkImage(
              //       imageUrl: widget.images[index].imageProductFormat(),
              //       fit: BoxFit.fill,
              //       placeholder: (context, url) => const SizedBox.shrink(),
              //       errorWidget:
              //           (context, url, error) => Icon(
              //             Icons.error,
              //             color: Colors.red,
              //             size: 40.h,
              //           ),
              //     ),
              //   ),
              // );
              final imageUrl = widget.images[index].imageProductFormat();
              final isValidUrl =
                  imageUrl.isNotEmpty &&
                  (imageUrl.startsWith('http://') ||
                      imageUrl.startsWith('https://'));
              return CustomContainerLinearCustomer(
                height: 16.h,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child:
                      isValidUrl
                          ? CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.fill,
                            placeholder:
                                (context, url) => const SizedBox.shrink(),
                            errorWidget:
                                (context, url, error) => Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 40.h,
                                ),
                          )
                          : Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                            size: 40.h,
                          ),
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.images.asMap().entries.map((entry) {
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

/*
CustomContainerLinearCustomer(
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

 */
