import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_fonts.dart';

class CustomBrandItem extends StatelessWidget {
  const CustomBrandItem({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });
  final String image;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: .circle,
            ),
            child: Center(
              child: Image.asset(image, fit: .contain, height: 35.h),
            ),
          ),
          //
          verticalSpace(8),
          //
          Text(text, style: AppFonts.font14DarkSemiBold),
        ],
      ),
    );
  }
}
