import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateUploadedImage extends StatelessWidget {
  const UpdateUploadedImage({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(15.r),
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1589462135796-2b46e4bdd7fe?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHF1cmFufGVufDB8fDB8fHww',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
