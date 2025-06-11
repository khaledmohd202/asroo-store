import 'package:asroo_store/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:asroo_store/features/admin/add_notification/presentation/widgets/edit/edit_notification_bottom_sheet.dart';
import 'package:flutter/material.dart';

class EditNotification extends StatelessWidget {
  const EditNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomBottomSheet.showModalBottomSheetContainer(
          context: context,
          widget: const EditNotificationBottomSheet(),
        );
      },
      child: const Icon(Icons.edit, color: Colors.white),
    );
  }
}
