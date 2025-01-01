import 'package:asroo/core/common/screens/under_build_screen.dart';
import 'package:asroo/core/routes/base_routes.dart';
import 'package:asroo/test_one.dart';
import 'package:asroo/test_two.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String testOne = 'testOne';
  static const String testTwo = 'testTwo';

  static Route<void> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case testOne:
        return BaseRoutes(page: const TestOne());
      case testTwo:
        return BaseRoutes(page: const TestTwo());
      default:
        return BaseRoutes(page: const UnderBuildScreen());
    }
  }
}
