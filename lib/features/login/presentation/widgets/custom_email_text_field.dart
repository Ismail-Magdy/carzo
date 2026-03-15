import 'package:carzo/core/helpers/app_regex.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEmailTextField extends StatelessWidget {
  const CustomEmailTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginCubit>().passwordController,
      validator: (value) {
        final trimmedValue = value?.trim() ?? "";
        if (trimmedValue.isEmpty || !AppRegex.isEmailValid(trimmedValue)) {
          return "Please enter a valid email.";
        }
        return null;
      },
      style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: "Please Enter your email.",
        hintStyle: const TextStyle(color: Color(0x7F4A628A)),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.8),
        border: OutlineInputBorder(
          borderRadius: .circular(14),
          borderSide: .none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(14),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: .circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2),
        ),
      ),
    );
  }
}
