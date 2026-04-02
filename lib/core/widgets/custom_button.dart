import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: .infinity,
      height: 50.h,
      color: AppColors.primaryColor,
      textColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: .circular(9.r)),
      onPressed: onPressed,
      child: Text(
        text.toString(),
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeightHelper.bold),
      ),
    );
  }
}
