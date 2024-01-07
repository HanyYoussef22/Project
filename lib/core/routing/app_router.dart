
import 'package:flutter/material.dart';
import 'package:project/core/routing/routers.dart';
import 'package:project/features/onboard/ui/onbording_screen.dart';

class AppRouter {
   Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case Routers.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => OnbordingScreen(),
        );
      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (_) => Container(),
        );
    // Add more cases for other routes as needed
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('no route defiend for ${settings.name}'),
            ),
          )
        );
    }
  }
}