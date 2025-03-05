import 'package:asroo_store/features/admin/users/presentation/widgets/search_for_users.dart';
import 'package:asroo_store/features/admin/users/presentation/widgets/table_for_users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          // Search For User.
          const SearchForUsers(),
          SizedBox(height: 20.h),
          // Table.
          Flexible(
            child: RefreshIndicator(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: TableForUsers(),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 25.h,),
                  ),
                ],
              ),
              onRefresh: () async {},
            ),
          ),
        ],
      ),
    );
  }
}
