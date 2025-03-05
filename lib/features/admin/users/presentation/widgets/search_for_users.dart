import 'package:asroo_store/core/common/widgets/custom_text_field.dart';
import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:flutter/material.dart';

class SearchForUsers extends StatelessWidget {
  const SearchForUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      hintText: 'Search For Users',
      onChanged: (value) {},
      suffixIcon: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.clear, color: DarkColors.blueLight),
      ),
    );
  }
}
