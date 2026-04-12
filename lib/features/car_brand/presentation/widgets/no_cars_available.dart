import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_fonts.dart';

class NoCarsAvailable extends StatelessWidget {
  const NoCarsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("No cars available", style: AppFonts.font16DarkSemiBold),
          //
          Image.asset(
            "assets/images/photos/no_cars_available.png",
            height: 200.h,
          ),
        ],
      ),
    );
  }
}
