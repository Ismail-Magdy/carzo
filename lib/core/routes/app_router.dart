import 'package:carzo/core/di/dependency_injection.dart';
import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/features/brands/manager/all_brands_cubit.dart';
import 'package:carzo/features/brands/presentation/screens/brands_screen.dart';
import 'package:carzo/features/car_details/car_details_screen.dart';
import 'package:carzo/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:carzo/features/get_started/presentation/screens/get_started_screen.dart';
import 'package:carzo/features/home/presentation/screens/home_screen.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:carzo/features/login/presentation/screens/login_screen.dart';
import 'package:carzo/features/notification/presentation/screens/notification_screen.dart';
import 'package:carzo/features/recommend_for_you/manager/all_cars_cubit.dart';
import 'package:carzo/features/recommend_for_you/presentation/screens/recommend_for_you_screen.dart';
import 'package:carzo/features/root/presentation/screens/root_screen.dart';
import 'package:carzo/features/sign_up/manager/sign_up_cubit.dart';
import 'package:carzo/features/sign_up/presentation/screens/sign_up_screen.dart';
import 'package:carzo/features/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/car_brand/manager/car_brand_cubit.dart';
import '../../features/car_brand/presentation/screens/car_brand_screen.dart';
import '../../features/favorite/manager/favorite_cubit.dart';

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

      /// Root Screen
      case Routes.rootScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<FavoriteCubit>.value(
            value: getIt<FavoriteCubit>(),
            child: const RootScreen(),
          ),
        );

      /// NotificationScreen
      case Routes.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());

      /// UserScreen
      case Routes.userScreen:
        return MaterialPageRoute(builder: (_) => const UserScreen());

      /// RecommendForYouScreen
      case Routes.recommendForYouScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<AllCarsCubit>(
                create: (context) => getIt<AllCarsCubit>()..emitAllCars(),
              ),
              BlocProvider<FavoriteCubit>.value(value: getIt<FavoriteCubit>()),
            ],
            child: const RecommendForYouScreen(),
          ),
        );

      /// Favorite Screen
      case Routes.favoriteScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<FavoriteCubit>.value(
            value: getIt<FavoriteCubit>(),
            child: const FavoriteScreen(),
          ),
        );

      /// Car Details Screen
      case Routes.carDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CarDetailsScreen());

      /// Brands Screen
      case Routes.brandsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AllBrandsCubit>(
            create: (context) => getIt<AllBrandsCubit>()..emitAllBrands(),
            child: const BrandsScreen(),
          ),
        );

      /// Car Brand Screen
      case Routes.carBrandScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CarBrandCubit>(
            create: (context) =>
                getIt<CarBrandCubit>()..emitGetAllBrandCars(masterBrandName),
            child: CarBrandScreen(brandName: masterBrandName),
          ),
        );

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
