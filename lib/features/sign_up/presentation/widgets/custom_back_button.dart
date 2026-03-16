import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .centerLeft,
      child: GestureDetector(
        onTap: () => context.pop(),
        child: SvgPicture.asset(
          "assets/svgs/arrow-square-left.svg",
          width: 26.w,
          height: 26.h,
          colorFilter: const ColorFilter.mode(AppColors.primaryColor, .srcIn),
        ),
      ),
    );
  }
}
