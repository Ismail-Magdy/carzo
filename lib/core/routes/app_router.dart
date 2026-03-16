import 'package:carzo/core/di/dependency_injection.dart';
import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/features/get_started/presentation/screens/get_started_screen.dart';
import 'package:carzo/features/home/presentation/screens/home_screen.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:carzo/features/login/presentation/screens/login_screen.dart';
import 'package:carzo/features/root/presentation/screens/root_screen.dart';
import 'package:carzo/features/sign_up/manager/sign_up_cubit.dart';
import 'package:carzo/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      /// GetStarted Screen
      case Routes.getStartedScreen:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());

      /// Login Screen
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      /// SignUp Screen
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignUpCubit>(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScreen(),
          ),
        );

      /// Home Screen
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      ///
      case Routes.rootScreen:
        return MaterialPageRoute(builder: (_) => const RootScreen());

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
