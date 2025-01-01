import 'package:flutter/material.dart';

class TestTwo extends StatelessWidget {
  const TestTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Two'),
      ),
    );
  }
}
