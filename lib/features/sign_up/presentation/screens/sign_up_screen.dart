import 'package:carzo/core/helpers/app_regex.dart';
import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/app_fonts.dart';
import 'package:carzo/core/widgets/custom_align_text.dart';
import 'package:carzo/core/widgets/custom_button.dart';
import 'package:carzo/core/widgets/custom_text_form_field.dart';
import 'package:carzo/features/login/presentation/widgets/custom_clickable_text.dart';
import 'package:carzo/features/login/presentation/widgets/logo_image.dart';
import 'package:carzo/features/sign_up/manager/sign_up_cubit.dart';
import 'package:carzo/features/sign_up/presentation/widgets/custom_back_button.dart';
import 'package:carzo/features/sign_up/presentation/widgets/password_validations.dart';
import 'package:carzo/features/sign_up/presentation/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: .symmetric(horizontal: 18.w),
              child: Form(
                key: context.read<SignUpCubit>().formKey,
                child: Column(
                  children: [
                    //
                    CustomBackButton(),
                    //
                    LogoImage(),
                    //
                    Text("Sign Up", style: AppFonts.font26DarkBold),
                    //
                    verticalSpace(20),
                    //
                    CustomAlignText(text: "FIRST NAME"),
                    //
                    verticalSpace(10),
                    // First Name
                    CustomTextFormField(
                      controller: context
                          .read<SignUpCubit>()
                          .firstNameController,
                      hintText: "Enter your first name.",
                      fieldType: .firstName,
                    ),
                    //
                    verticalSpace(26),
                    //
                    CustomAlignText(text: "LAST NAME"),
                    //
                    verticalSpace(10),
                    // Last Name
                    CustomTextFormField(
                      controller: context
                          .read<SignUpCubit>()
                          .lastNameController,
                      hintText: "Enter your last name.",
                      fieldType: .lastName,
                    ),
                    //
                    verticalSpace(26),
                    //
                    CustomAlignText(text: "PHONE NUMBER"),
                    //
                    verticalSpace(10),
                    // Phone Number
                    CustomTextFormField(
                      controller: context
                          .read<SignUpCubit>()
                          .phoneNumberController,
                      hintText: "Enter your phome number.",
                      fieldType: .phoneNumber,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    //
                    verticalSpace(26),
                    //
                    CustomAlignText(text: "USER NAME"),
                    //
                    verticalSpace(10),
                    // UserName
                    CustomTextFormField(
                      controller: context
                          .read<SignUpCubit>()
                          .userNameController,
                      hintText: "Enter your username.",
                      fieldType: .userName,
                    ),
                    //
                    verticalSpace(26),
                    //
                    CustomAlignText(text: "EMAIL"),
                    //
                    verticalSpace(10),
                    // Email
                    CustomTextFormField(
                      controller: context.read<SignUpCubit>().emailController,
                      hintText: "Please Enter your email.",
                      fieldType: .email,
                    ),
                    //
                    verticalSpace(26),
                    //
                    CustomAlignText(text: "PASSWORD"),
                    //
                    verticalSpace(10),
                    // Password
                    CustomTextFormField(
                      fieldType: .password,
                      controller: context
                          .read<SignUpCubit>()
                          .passwordController,
                      hintText: "Please Enter your Password.",
                    ),
                    //
                    verticalSpace(20),
                    //
                    PasswordValidations(
                      hasLowerCase: hasLowercase,
                      hasUpperCase: hasUppercase,
                      hasSpecialCharacters: hasSpecialCharacters,
                      hasNumber: hasNumber,
                      hasMinLength: hasMinLength,
                    ),
                    //
                    verticalSpace(30),
                    // Button
                    CustomButton(
                      text: "Sign up",
                      onPressed: () => validateThenSignup(context),
                    ),
                    //
                    verticalSpace(10),
                    //
                    CustomClickableText(
                      leftText: "Already have an account ? ",
                      rightText: "Login",
                      onTap: () => context.pushNamed(Routes.loginScreen),
                    ),
                    //
                    verticalSpace(5),
                    //
                    const SignUpBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<SignUpCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    context.read<SignUpCubit>().passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(
          context.read<SignUpCubit>().passwordController.text,
        );
        hasUppercase = AppRegex.hasUpperCase(
          context.read<SignUpCubit>().passwordController.text,
        );
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          context.read<SignUpCubit>().passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(
          context.read<SignUpCubit>().passwordController.text,
        );
        hasMinLength = AppRegex.hasMinLength(
          context.read<SignUpCubit>().passwordController.text,
        );
      });
    });
  }

  void validateThenSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpState();
    }
  }

  @override
  void dispose() {
    context.read<SignUpCubit>().passwordController.dispose();
    super.dispose();
  }
}
