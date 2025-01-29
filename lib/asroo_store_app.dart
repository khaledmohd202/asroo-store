import 'package:asroo_store/core/app/connectivity_controller.dart';
import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/common/screens/no_network_screen.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AsrooStoreApp extends StatelessWidget {
  const AsrooStoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnectivityController.instance.isConnected,
      builder: (_, value, _) {
        if (value) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            child: MaterialApp(
              title: 'Asroo Store',
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
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
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: AppRoutes.testOne,
            ),
          );
        } else {
          return MaterialApp(
            title: 'No Network',

            debugShowCheckedModeBanner: EnvVariable.instance.debugMode,

            home: const NoNetworkScreen(),
          );
        }
      },
    );
  }
}
