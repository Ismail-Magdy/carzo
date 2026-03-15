import 'package:carzo/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomClickableText extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Function()? onTap;
  const CustomClickableText({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          text: leftText,
          style: TextStyle(
            color: const Color(0xCC4A628A),
            fontSize: 16.sp,
            height: 0,
          ),
          children: [
            TextSpan(
              text: rightText,
              style: TextStyle(
                color: const Color(0xFF8FBFC2),
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 16.sp,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
