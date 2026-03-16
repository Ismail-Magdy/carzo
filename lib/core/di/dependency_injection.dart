import 'package:carzo/core/networking/api_services.dart';
import 'package:carzo/core/networking/dio_factory.dart';
import 'package:carzo/features/login/data/repos/login_repo.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:carzo/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:carzo/features/sign_up/manager/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));

  // SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerLazySingleton<SignUpCubit>(() => SignUpCubit(getIt()));
}
