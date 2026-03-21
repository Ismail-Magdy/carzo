import 'package:carzo/core/networking/api_result.dart';
import 'package:carzo/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:carzo/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:carzo/features/sign_up/manager/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _repo;
  SignUpCubit(this._repo) : super(const SignUpState.idle());

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignUpState() async {
    if (!formKey.currentState!.validate()) return;
    emit(const SignUpState.loading());
    try {
      final data = await _repo.signUp(
        SignUpRequestModel(
          firstName: firstNameController.text.trim(),
          lastName: lastNameController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
          userName: userNameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
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

  //
  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
