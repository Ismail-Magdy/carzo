import 'package:carzo/core/helpers/constants.dart';
import 'package:carzo/core/helpers/shared_pref_helper.dart';
import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/core/networking/dio_factory.dart';
import 'package:carzo/features/login/data/models/login_request_model.dart';
import 'package:carzo/features/login/data/repos/login_repo.dart';
import 'package:carzo/features/login/manager/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.idle());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    if (!formKey.currentState!.validate()) return;

    emit(const LoginState.loading());

    try {
      final data = await _loginRepo.login(
        LoginRequestModel(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
      data.when(
        success: (loginResponse) async {
          await saveUserToken(loginResponse.token ?? "");
          await saveNameAndEmail(
            loginResponse.displayName ?? "",
            loginResponse.email ?? "",
            loginResponse.appUserId ?? "",
          );
          emit(LoginState.success(loginResponse));
        },
        failure: (error) {
          emit(
            LoginState.failure(
              error:
                  error.message ??
                  "An unexpected error occurred. Please try again.",
            ),
          );
        },
      );
    } catch (error) {
      emit(
        LoginState.failure(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> saveNameAndEmail(
    String name,
    String email,
    String appUserId,
  ) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userName, name);
    await SharedPrefHelper.setData(SharedPrefKeys.userEmail, email);
    await SharedPrefHelper.setData(SharedPrefKeys.appUserId, appUserId);
  }
}
