import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/app_fonts.dart';
import 'package:carzo/core/widgets/custom_common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .center,
          children: [
            CustomCommonAppBar(text: "Notification"),
            //
            Expanded(
              child: Padding(
                padding: .symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/photos/notification_page.svg",
                      height: 170.h,
                    ),
                    //
                    verticalSpace(22),
                    //
                    Text("NO NOTIFICATIONS", style: AppFonts.font16DarkBold),
                    //
                    verticalSpace(12),
                    //
                    Text(
                      textAlign: .center,
                      "Clutter cleared. We'll notify you when something new is found.",
                      style: AppFonts.font14GreyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
