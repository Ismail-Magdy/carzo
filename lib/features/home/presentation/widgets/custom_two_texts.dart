import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/app_fonts.dart';

class CustomTwoTexts extends StatelessWidget {
  const CustomTwoTexts({
    super.key,
    required this.leftText,
    required this.onTap,
    this.padding,
  });
  final String leftText;
  final void Function() onTap;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: padding == null ? 12.w : padding!.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(leftText, style: AppFonts.font16DarkSemiBold),
            Text("View All", style: AppFonts.font14GreyRegular),
          ],
        ),
      ),
    );
  }
}
