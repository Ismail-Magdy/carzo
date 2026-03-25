import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:carzo/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:carzo/features/sign_up/manager/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _repo;
  SignUpCubit(this._repo) : super(const SignUpState.idle());
  //
  void emitSignUpState({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String userName,
    required String email,
    required String password,
  }) async {
    emit(const SignUpState.loading());
    try {
      final data = await _repo.signUp(
        SignUpRequestModel(
          firstName: firstName.trim(),
          lastName: lastName.trim(),
          phoneNumber: phoneNumber.trim(),
          userName: userName.trim(),
          email: email.trim(),
          password: password.trim(),
        ),
      );
      data.when(
        success: (signUpResponse) {
          emit(SignUpState.success(signUpResponse));
        },
        failure: (error) {
          emit(SignUpState.failure(error: error.message.toString()));
        },
      );
    } catch (error) {
      emit(
        SignUpState.failure(
          error: "An unexpected error occurred. Please try again.",
        ),
      );
    }
  }
}
