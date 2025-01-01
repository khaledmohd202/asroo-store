import 'package:asroo/core/app/connectivity_controller.dart';
import 'package:asroo/core/app/env.variables.dart';
import 'package:asroo/core/common/screens/no_network_screen.dart';
import 'package:asroo/core/routes/app_routes.dart';
import 'package:asroo/core/style/fonts/font_family_helper.dart';
import 'package:asroo/core/style/fonts/font_weight_helper.dart';
import 'package:asroo/test_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, __) {
        if (value) {
          return ScreenUtilInit(
            // designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
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
              initialRoute: AppRoutes.testOne,
              onGenerateRoute: AppRoutes.onGenerateRoute,
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
