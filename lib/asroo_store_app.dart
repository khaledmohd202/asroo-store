import 'package:asroo_store/core/app/app_cubit/app_cubit.dart';
import 'package:asroo_store/core/app/connectivity_controller.dart';
import 'package:asroo_store/core/app/env.variables.dart';
import 'package:asroo_store/core/common/screens/no_network_screen.dart';
import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/languages/app_localizations_setup.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:asroo_store/core/service/shared_pref/pref_keys.dart';
import 'package:asroo_store/core/service/shared_pref/shared_pref.dart';
import 'package:asroo_store/core/style/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return BlocProvider(
            create:
                (context) =>
                    sl<AppCubit>()..changeAppThemeMode(
                      sharedMode: SharedPref().getBoolean(PrefKeys.themeMode),
                    )..getSavedLanguage(),
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) {
                  return previous != current;
                },
                builder: (context, state) {
                  final cubit = context.read<AppCubit>();
                  return MaterialApp(
                    title: 'Asroo Store',
                    debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                    theme: cubit.isDark ? lightTheme() : darkTheme(),
                    locale: Locale(cubit.currentLangCode),
                    supportedLocales: AppLocalizationsSetup.supportedLocales,
                    localizationsDelegates:
                        AppLocalizationsSetup.localizationsDelegates,
                    localeResolutionCallback:
                        AppLocalizationsSetup.localeResolutionCallback,
                    builder: (context, widget) {
                      return GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Scaffold(
                          body: Builder(
                            builder: (context) {
                              ConnectivityController.instance.init();
                              return widget!;
                            },
                          ),
                        ),
                      );
                    },
                    onGenerateRoute: AppRoutes.onGenerateRoute,
                    initialRoute: AppRoutes.login,
                  );
                },
              ),
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
