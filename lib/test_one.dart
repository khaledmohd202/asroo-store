import 'package:asroo/core/extensions/context_extension.dart';
import 'package:asroo/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestOne extends StatelessWidget {
  const TestOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('One'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            // Navigator.of(context).pushNamed(AppRoutes.testTwo);
            context.pushNamed(AppRoutes.testTwo);
          },
          child: Text(
            'Go to "Two Screen"',
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}
