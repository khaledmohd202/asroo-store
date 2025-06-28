import 'package:asroo_store/features/customer/search/presentation/widgets/filter_buttons.dart';
// import 'package:asroo_store/features/customer/search/presentation/widgets/search_for_data_icon.dart';
import 'package:flutter/material.dart';
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
          // SizedBox(height: 30.h),
          // const SearchForDataIcon(),
        ],
      ),
    );
  }
}
