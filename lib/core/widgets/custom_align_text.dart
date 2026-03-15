import 'package:carzo/core/themes/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomAlignText extends StatelessWidget {
  final String? text;
  const CustomAlignText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .centerLeft,
      child: Text(
        text.toString(),
        style: AppFonts.font12DarkMedium.copyWith(
          height: 0.5,
          letterSpacing: 1.89,
        ),
      ),
    );
  }
}
