import 'package:carzo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/master/carzo_logo.png",
      height: 200.h,
      width: 200.w,
      fit: .contain,
      color: AppColors.primaryColor.withValues(alpha: 0.75),
    );
  }
}
