import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/app_fonts.dart';
import 'package:carzo/core/widgets/custom_align_text.dart';
import 'package:carzo/core/widgets/custom_button.dart';
import 'package:carzo/core/widgets/custom_text_form_field.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:carzo/features/login/presentation/widgets/custom_clickable_text.dart';
import 'package:carzo/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:carzo/features/login/presentation/widgets/logo_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                key: context.read<LoginCubit>().formKey,
                child: Column(
                  children: [
                    // Logo Image
                    const LogoImage(),
                    // Welcome Text
                    Text("Welcome to Carzo", style: AppFonts.font26DarkBold),
                    //
                    verticalSpace(50),
                    // Email Text
                    CustomAlignText(text: "EMAIL"),
                    //
                    verticalSpace(10),
                    // Email Text Field
                    CustomTextFormField(
                      controller: context.read<LoginCubit>().emailController,
                      hintText: "Please Enter your email.",
                      fieldType: .email,
                    ),
                    //
                    verticalSpace(26),
                    // Password Text
                    CustomAlignText(text: "PASSWORD"),
                    //
                    verticalSpace(10),
                    // Password Text Field
                    CustomTextFormField(
                      controller: context.read<LoginCubit>().passwordController,
                      hintText: "Please Enter your Password.",
                      fieldType: .password,
                    ),
                    //
                    verticalSpace(50),
                    //
                    CustomButton(
                      text: "Login",
                      onPressed: () {
                        validateThenLogin(context);
                      },
                    ),
                    //
                    verticalSpace(10),
                    //
                    CustomClickableText(
                      leftText: "Don’t have an account? ",
                      rightText: "Sign up",
                      onTap: () => context.pushNamed(Routes.signUpScreen),
                    ),
                    //
                    const LoginBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
