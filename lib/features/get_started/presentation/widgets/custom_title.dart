import 'package:carzo/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final int currentIndex;
  const CustomTitle({
    super.key,
    required this.title,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: currentIndex == 0 ? 43.sp : 35.sp,
          fontWeight: FontWeightHelper.semiBold,
          height: 0,
        ),
      ),
    );
  }
}
