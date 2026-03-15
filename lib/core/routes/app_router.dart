import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/features/get_started/presentation/screens/get_started_screen.dart';
import 'package:carzo/features/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// GetStarted Screen
      case Routes.getStartedScreen:
        return MaterialPageRoute(builder: (_) => GetStartedScreen());

      /// Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      /// Default Case
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Page Found For This ${settings.name}"),
            ),
          ),
        );
    }
  }
}
