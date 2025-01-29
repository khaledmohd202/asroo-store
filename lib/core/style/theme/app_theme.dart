import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/colors/light_colors.dart';
import 'package:asroo_store/core/style/theme/color_extension.dart';
import 'package:asroo_store/core/style/theme/image_extension.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: DarkColors.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.dark, MyImages.dark],
    useMaterial3: true,
  );
}

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: LightColors.mainColor,
    extensions: const <ThemeExtension<dynamic>>[MyColors.light, MyImages.light],
    useMaterial3: true,
  );
}
