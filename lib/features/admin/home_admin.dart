import 'package:flutter/material.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: const Text('Home Admin', style: TextStyle(
        color: Colors.blue,
      ),),
    ),);
  }
}
