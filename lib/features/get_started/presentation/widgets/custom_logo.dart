import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/master/carzo_white_logo.png",
      width: 220.w,
      height: 220.h,
    );
  }
}
