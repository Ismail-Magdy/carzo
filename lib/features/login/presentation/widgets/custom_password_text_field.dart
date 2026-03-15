import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/login/manager/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({super.key});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: context.read<LoginCubit>().emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a valid password.";
        }
        return null;
      },
      obscureText: _obscureText,
      style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: "Please Enter your Password.",
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

        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
