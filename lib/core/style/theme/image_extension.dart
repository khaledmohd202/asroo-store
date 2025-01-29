import 'package:asroo_store/core/style/images/app_images.dart';
import 'package:flutter/material.dart';

class MyImages extends ThemeExtension<MyImages> {
  const MyImages({required this.testImage});
  // and in another Image we had color as attribute and added it in all methods

  final String? testImage;
  // final String? anotherImage;

  // and added here like testImage
  @override
  ThemeExtension<MyImages> copyWith({String? testImage}) {
    return MyImages(testImage: testImage);
  }

  // and added here like testImage

  @override
  ThemeExtension<MyImages> lerp(
    covariant ThemeExtension<MyImages>? other,
    double t,
  ) {
    if (other is! MyImages) {
      return this;
    }

    return MyImages(testImage: testImage);
  }

  // and added here like testImage
  static const MyImages light = MyImages(testImage: AppImages.testLight);

  // and added here like testImage
  static const MyImages dark = MyImages(testImage: AppImages.testDark);
}
