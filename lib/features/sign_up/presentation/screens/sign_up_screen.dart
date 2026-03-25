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
  //
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  //

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
                key: _formKey,
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
                      controller: _firstNameController,
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
                      controller: _lastNameController,
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
                      controller: _phoneNumberController,
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
                      controller: _userNameController,
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
                      controller: _emailController,
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
                      controller: _passwordController,
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
    _passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(_passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(_passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          _passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(_passwordController.text);
        hasMinLength = AppRegex.hasMinLength(_passwordController.text);
      });
    });
  }

  void validateThenSignup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpState(
        email: _emailController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        phoneNumber: _phoneNumberController.text,
        userName: _userNameController.text,
        password: _passwordController.text,
      );
    }
  }
}
