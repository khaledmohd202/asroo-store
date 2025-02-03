import 'package:asroo_store/core/common/screens/under_build_screen.dart';
import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:asroo_store/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const login = 'login';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoutes(page: const LoginScreen());
      default:
        return BaseRoutes(page: const PageUnderBuildScreen());
    }
  }
}
