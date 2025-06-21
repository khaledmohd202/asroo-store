import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerLinearCustomer extends StatelessWidget {
  const CustomContainerLinearCustomer({
    required this.height,
    required this.width,
    required this.child,
    super.key,
  });

  final double height;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            context.color.containerLinear1!.withValues(alpha: 0.8),
            context.color.containerLinear2!.withValues(alpha: 0.8),
          ],
          begin: const Alignment(0.36, 0.27),
          end: const Alignment(0.58, 0.85),
        ),
        boxShadow: [
          BoxShadow(
            color: context.color.containerShadow1!.withValues(alpha: 0.3),
            offset: const Offset(0, 4),
            blurRadius: 8.r,
          ),
          BoxShadow(
            color: context.color.containerShadow2!.withValues(alpha: 0.3),
            offset: const Offset(0, 4),
            blurRadius: 2.r,
          ),
        ],
      ),
      child: child,
    );
  }
}
