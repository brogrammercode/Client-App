import 'package:adapp/components/body/body.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const Body());
      // case slideBody:
      //   final args = settings.arguments as Map<String, dynamic>?;
      //   return MaterialPageRoute(
      //     builder: (_) => SlideBody(slide: args?['slide']),
      //   );

      // default
      default:
        return MaterialPageRoute(builder: (_) => const Body());
    }
  }
}
