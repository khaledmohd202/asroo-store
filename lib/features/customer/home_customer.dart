import 'package:flutter/material.dart';

class HomeCustomer extends StatelessWidget {
  const HomeCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Customer', style: TextStyle(color: Colors.blue)),
      ),
    );
  }
}
