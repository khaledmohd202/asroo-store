import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/languages/lang_keys.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestOneScreen extends StatelessWidget {
  const TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: const Center(child: Text('One'))),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                context.pushNamed(AppRoutes.testTwo);
              },
              child: Text(
                'Go To Two Screen',
                style: TextStyle(
                  color: context.color.mainColor,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
          Text(
            context.translate(LangKeys.appName),
            style: TextStyle(color: Colors.black, fontSize: 40.sp),
          ),
          Image.asset(context.assets.testImage ?? ''),
        ],
      ),
    );
  }
}
