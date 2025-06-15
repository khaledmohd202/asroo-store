import 'package:asroo_store/core/common/animations/animate_do.dart';
import 'package:asroo_store/core/enum/nav_bar_enum.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:asroo_store/features/customer/main/presentation/cubit/main/main_cubit.dart';
import 'package:asroo_store/features/customer/main/presentation/widget/icon_tap_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                          child: BlocBuilder<MainCubit, MainState>(
                            builder: (context, state) {
                              final cubit = context.read<MainCubit>();
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Home Screen Icon
                                  IconTapNavBar(
                                    icon: AppImages.homeTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.home,
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                        NavBarEnum.home,
                                      );
                                    },
                                  ),
                                  // Categories Screen Icon
                                  IconTapNavBar(
                                    icon: AppImages.categoriesTab,
                                    isSelected:
                                        cubit.navBarEnum ==
                                        NavBarEnum.categories,
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                        NavBarEnum.categories,
                                      );
                                    },
                                  ),
                                  // Favorites Screen Icon
                                  IconTapNavBar(
                                    icon: AppImages.favoritesTab,
                                    isSelected:
                                        cubit.navBarEnum ==
                                        NavBarEnum.favorites,
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                        NavBarEnum.favorites,
                                      );
                                    },
                                  ),
                                  // Profile Screen Icon
                                  IconTapNavBar(
                                    icon: AppImages.profileTab,
                                    isSelected:
                                        cubit.navBarEnum == NavBarEnum.profile,
                                    onTap: () {
                                      cubit.selectedNavBarIcons(
                                        NavBarEnum.profile,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
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
