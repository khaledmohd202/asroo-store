import 'package:asroo_store/core/common/widgets/text_app.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/fonts/font_family_helper.dart';
import 'package:asroo_store/core/style/fonts/font_weight_helper.dart';
import 'package:asroo_store/features/admin/users/data/models/get_all_users_response.dart';
import 'package:asroo_store/features/admin/users/presentation/widgets/table_cell_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableForUsers extends StatelessWidget {
  const TableForUsers({required this.usersList, super.key});

  final List<GetAllUsersModel> usersList;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: DarkColors.blueLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.r),
          bottomRight: Radius.circular(15.r),
          // topLeft: Radius.circular(15.r),
        ),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: const FlexColumnWidth(),
        2: FixedColumnWidth(110.w),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: DarkColors.blueLight.withValues(alpha: 0.7),
          ),
          children: const [
            // Name.
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitle(icon: Icons.person, title: 'Name'),
            ),
            // Email.
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitle(icon: Icons.email, title: 'Email'),
            ),
            // Delete.
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: TableCellTitle(
                icon: Icons.delete_forever,
                title: 'Delete',
              ),
            ),
          ],
        ),
        ...List.generate(
          usersList.length,
          (index) => TableRow(
            children: [
              // Name.
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(10.dg),
                  child: TextApp(
                    text: usersList[index].name ?? 'Khaled',
                    theme: context.textStyle.copyWith(
                      fontSize: 12.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
              ),
              // Email.
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(10.dg),
                  child: TextApp(
                    text: usersList[index].email ?? 'khaledmohd@gmail.com',
                    theme: context.textStyle.copyWith(
                      fontSize: 12.sp,
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
              ),
              // Delete.
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(10.dg),
                  child: const Icon(Icons.delete, color: Colors.red, size: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
