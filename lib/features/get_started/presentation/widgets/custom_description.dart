import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDescription extends StatelessWidget {
  final String description;
  const CustomDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .centerLeft,
      child: Text(
        description,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 15.sp,
          fontWeight: FontWeightHelper.regular,
          height: 0,
        ),
      ),
    );
  }
}
