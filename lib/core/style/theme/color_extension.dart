import 'package:asroo/core/style/colors/colors_dark.dart';
import 'package:asroo/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';

class MyColors extends ThemeExtension<MyColors> {
  const MyColors({required this.mainColor});

  final Color? mainColor;
  // if we need adding a new color create field
  // and add it like 'mainColor'

  @override
  ThemeExtension<MyColors> copyWith({Color? mainColor}) {
    return MyColors(mainColor: mainColor);
  }

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

  static const MyColors dark = MyColors(mainColor: ColorsDark.mainColor);
  static const MyColors light = MyColors(mainColor: ColorsLight.mainColor);
}