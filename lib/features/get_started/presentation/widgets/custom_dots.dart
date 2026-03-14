import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDots extends StatelessWidget {
  final int length;
  final int currentIndex;
  const CustomDots({
    super.key,
    required this.length,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .center,
      children: .generate(
        length,
        (index) => Container(
          height: 8.h,
          width: currentIndex == index ? 30.w : 8.w,
          margin: .only(right: 5.w),
          decoration: BoxDecoration(
            borderRadius: .circular(20.r),
            color: currentIndex == index
                ? const Color(0xff9CA3AF)
                : const Color(0xffD7D7D7),
          ),
        ),
      ),
    );
  }
}
