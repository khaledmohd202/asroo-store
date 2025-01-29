import 'package:asroo_store/core/style/colors/dark_colors.dart';
import 'package:asroo_store/core/style/colors/light_colors.dart';
import 'package:flutter/material.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.mainColor});
  // and in another color we had color as attribute and added it in all methods

  final Color? mainColor;
  // final Color? anotherColor;


  // and added here like mainColor
  @override
  ThemeExtension<MyColors> copyWith({Color? mainColor}) {
    return MyColors(mainColor: mainColor);
  }

  // and added here like mainColor

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }

    return MyColors(mainColor: mainColor);
  }


  // and added here like mainColor
  static const MyColors light = MyColors(mainColor: LightColors.mainColor);

  // and added here like mainColor
  static const MyColors dark = MyColors(mainColor: DarkColors.mainColor);
}
