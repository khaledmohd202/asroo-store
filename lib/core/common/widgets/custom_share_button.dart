import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomShareButton extends StatelessWidget {
  const CustomShareButton({
    required this.size,
    required this.onPressed,
    super.key,
  });

  final double size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.share,
        size: size,
        color: context.color.textColor,
      ),
    );
  }
}
