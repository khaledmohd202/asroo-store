import 'package:asroo/core/app/connectivity_controller.dart';
import 'package:asroo/core/app/env.variables.dart';
import 'package:asroo/core/common/screens/no_network_screen.dart';
import 'package:flutter/material.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return MaterialApp(
            debugShowCheckedModeBanner: EnvVariables.instance.debugMode,
            title: 'Asroo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            builder: (context, widget) {
              return Scaffold(
                body: Builder(
                  builder: (context) {
                    ConnectivityController.instance.init();
                    return widget!;
                  },
                ),
              );
            },
            home: Scaffold(
              appBar: AppBar(
                title: const Text('Hello World!'),
              ),
            ),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: EnvVariables.instance.debugMode,
            title: 'No Network',
            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
