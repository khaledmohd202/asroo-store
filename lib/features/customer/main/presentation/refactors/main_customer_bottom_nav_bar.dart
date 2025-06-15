import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/main/presentation/widget/icon_tap_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainCustomerBottomNavBar extends StatelessWidget {
  const MainCustomerBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 103.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // Icons.
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 15.h),
                  Container(
                    height: 70.h,
                    color: context.color.navBarbg,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: 45.h,
                        width: 300.w,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Home Screen Icon
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.homeTab,
                                isSelected: true,
                              ),
                              // Categories Screen Icon
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.categoriesTab,
                                isSelected: true,
                              ),
                              // Favorites Screen Icon
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.favoritesTab,
                                isSelected: true,
                              ),
                              // Profile Screen Icon
                              IconTapNavBar(
                                onTap: () {},
                                icon: AppImages.profileTab,
                                isSelected: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Background Icon.
              Positioned(
                top: 10.h,
                left: -8.w,
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(context.assets.bigNavBar!),
                    ),
                  ),
                ),
              ),
              // Car Icon.
              Positioned(
                left: 30.w,
                top: 32.h,
                child: SvgPicture.asset(
                  AppImages.carShop,
                  height: 22.h,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
