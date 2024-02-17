
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/core/di/depenaancy_injection.dart';
import 'package:project/core/routing/routers.dart';
import 'package:project/features/login/logic/login_cubit.dart';
import 'package:project/features/login/ui/login_screen.dart';
import 'package:project/features/signup_screen/logic/signup_cubit.dart';

import '../../features/home/ui/home_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/signup_screen/ui/signup_screen.dart';
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
          builder: (context) => BlocProvider(
            create: (context)=>getIt<LoginCubit>(),
              child: const LoginScreen()),
        );
      case Routers.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const homeScreen(),
        );
      case Routers.signupScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context)=>getIt<SignupCubit>(),
              child: const SignupScreen()),
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