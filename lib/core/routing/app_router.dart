
import 'package:flutter/material.dart';
import 'package:project/core/routing/routers.dart';

import '../../features/onboarding/ui/onboarding_screen.dart';
// import 'package:project/features/onboard/ui/onbording_screen.dart';

class AppRouter {
   Route generateRouter(RouteSettings settings) {
      //this arguments to passed in ant=y screen like this ( argument as ClassName)
     final argument =settings.arguments;
    switch (settings.name) {
      case Routers.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboarderScreen(),
        );
      case Routers.loginScreen:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text( 'login'),
            ),
          )
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