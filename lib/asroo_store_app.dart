import 'package:asroo_store/core/app/env.variables.dart';
import 'package:flutter/material.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asroo Store',
      debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Asroo Store'),
        ),
      ),
    );
  }
}
