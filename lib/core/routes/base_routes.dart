import 'package:flutter/material.dart';

class BaseRoutes extends PageRouteBuilder<dynamic> {
  BaseRoutes({required this.page})
    : super(
        pageBuilder:
            (context, animation, secondaryAnimation) => Stack(children: [page]),
        transitionsBuilder: (context, animation, secondaryAnimation, widget) {
          const begin = 0.0;
          const end = 1.0;
          final tween = Tween(begin: begin, end: end);
          final curvesAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.linearToEaseOut,
          );

          return ScaleTransition(
            scale: tween.animate(curvesAnimation),
            child: widget,
          );
        },
      );

  Widget page;
}
