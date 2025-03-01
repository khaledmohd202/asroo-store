import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

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
            'https://plus.unsplash.com/premium_photo-1677587536653-0d02efbb70ee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cXVyYW58ZW58MHx8MHx8fDA%3D',
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
