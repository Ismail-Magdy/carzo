import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/core/networking/dio_factory.dart';
import 'package:carzo/features/brands/data/repos/all_brands_repo.dart';
import 'package:carzo/features/favorite/manager/favorite_cubit.dart';
import 'package:carzo/features/login/data/repos/login_repo.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:carzo/features/recommend_for_you/data/repos/all_cars_repo.dart';
import 'package:carzo/features/recommend_for_you/manager/all_cars_cubit.dart';
import 'package:carzo/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:carzo/features/sign_up/manager/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/brands/manager/all_brands_cubit.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  /// Dio & ApiService
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  /// SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  /// Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  /// SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  /// Recommend For You & Get All Cars
  getIt.registerLazySingleton<AllCarsRepo>(() => AllCarsRepo(getIt()));
  getIt.registerFactory<AllCarsCubit>(() => AllCarsCubit(getIt()));

  /// All Brands
  getIt.registerLazySingleton<AllBrandsRepo>(() => AllBrandsRepo(getIt()));
  getIt.registerFactory<AllBrandsCubit>(() => AllBrandsCubit(getIt()));

  /// Favorite Cars
  getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit());
}
