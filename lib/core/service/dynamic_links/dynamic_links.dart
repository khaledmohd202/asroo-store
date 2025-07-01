import 'package:asroo_store/core/di/injection_container.dart';
import 'package:asroo_store/core/extensions/context_extension.dart';
import 'package:asroo_store/core/routes/app_routes.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinks {
  factory DynamicLinks() {
    return _instance;
  }
  DynamicLinks._();

  static final DynamicLinks _instance = DynamicLinks._();

  Future<String> generateProductLink({
    required int productId,
    required String title,
    required String imageUrl,
  }) async {
    final dynamicLinkParams = DynamicLinkParameters(
      socialMetaTagParameters: SocialMetaTagParameters(
        imageUrl: Uri.parse(imageUrl),
        description: 'Big Offers %50',
        title: title,
      ),
      // the best way to this links to put it in ENV Files.
      link: Uri.parse('https://www.udemy.com/$productId'),
      uriPrefix: 'https://asroostore-81f75.page.link',
      androidParameters: const AndroidParameters(
        packageName: 'com.example.asroo_store',
        minimumVersion: 1,
      ),
      iosParameters: const IOSParameters(
        bundleId: 'com.example.asrooStore',
        minimumVersion: '1',
      ),
    );
    final dynamicLink = await FirebaseDynamicLinks.instance.buildShortLink(
      dynamicLinkParams,
    );

    debugPrint('DynamincLink: $dynamicLink');
    return dynamicLink.shortUrl.toString();
  }

  Future<void> initDynamicLink() async {
    final initialLink = await FirebaseDynamicLinks.instance.getInitialLink();
    if (initialLink != null) {
      //nav background
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          _handelDeepLinkNavigation(initialLink.link.path);
        },
      );
    }
    FirebaseDynamicLinks.instance.onLink
        .listen((dynamicLinkData) {
          //forground
          final path = dynamicLinkData.link.path;
          debugPrint('dynamic link path: $path');
          //nav

          Future.delayed(
            const Duration(milliseconds: 500),
            () {
              _handelDeepLinkNavigation(path);
            },
          );
        })
        .onError((dynamic error) {
          debugPrint('onLink error: $error');
        });
  }

  void _handelDeepLinkNavigation(String path) {
    final splitLink = path.split('/');

    sl<GlobalKey<NavigatorState>>().currentState!.context.pushNamed(
      AppRoutes.productDetails,
      arguments: int.parse(splitLink[1]),
    );
  }
}
