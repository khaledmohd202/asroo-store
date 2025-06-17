import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/features/customer/profile/presentation/refactors/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const ProfileBody(),
    );
  }
}
