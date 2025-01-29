import 'package:flutter/material.dart';

class TestTwoScreen extends StatelessWidget {
  const TestTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: const Center(child: Text('Two'))),
    );
  }
}
