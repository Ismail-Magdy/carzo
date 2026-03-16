import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonForGetStartedScreen extends StatelessWidget {
  final int currentIndex;
  final PageController pageController;
  const CustomButtonForGetStartedScreen({
    super.key,
    required this.currentIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: .infinity,
      height: 50.h,
      color: AppColors.primaryColor,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: .circular(9.r)),
      onPressed: () {
        if (currentIndex == 1) {
          context.pushNamed(Routes.loginScreen);
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        }
      },
      child: Text(
        currentIndex == 0 ? "Next" : "Get Started",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeightHelper.bold),
      ),
    );
  }
}
