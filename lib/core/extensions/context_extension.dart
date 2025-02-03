import 'package:asroo_store/core/languages/app_localizations.dart';
import 'package:asroo_store/core/style/theme/color_extension.dart';
import 'package:asroo_store/core/style/theme/assets_extension.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  void pop() => Navigator.of(this).pop();

  // Colors
  MyColors get color => Theme.of(this).extension<MyColors>()!;

  // Images
  MyAssets get assets => Theme.of(this).extension<MyAssets>()!;

  //Language
  String translate(String langKey) {
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }
}
