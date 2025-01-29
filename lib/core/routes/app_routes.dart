import 'package:asroo_store/core/common/screens/under_build_screen.dart';
import 'package:asroo_store/core/routes/base_routes.dart';
import 'package:asroo_store/test_one_screen.dart';
import 'package:asroo_store/test_two_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const testOne = 'testOne';
  static const testTwo = 'testTwo';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case testOne:
        return BaseRoutes(page: const TestOneScreen());
      case testTwo:
        return BaseRoutes(page: const TestTwoScreen());
      default:
        return BaseRoutes(page: const PageUnderBuildScreen());
    }
  }
}
