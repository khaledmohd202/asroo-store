import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class TestOneScreen extends StatelessWidget {
  const TestOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: const Center(child: Text('One'))),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushNamed(AppRoutes.testTwo);
          },
          child: const Text(
            'Go To Two Screen',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
