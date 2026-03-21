import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/core/networking/dio_factory.dart';
import 'package:carzo/features/login/data/repos/login_repo.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:carzo/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:carzo/features/sign_up/manager/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}
