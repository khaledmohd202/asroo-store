import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomFavoriteButton extends StatelessWidget {
  const CustomFavoriteButton({
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
        Icons.favorite_border,
        color: context.color.textColor,
        size: size,
      ),
    );
  }
}
