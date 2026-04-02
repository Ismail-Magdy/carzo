import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: .symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              //
              Image.asset(
                "assets/images/master/carzo_logo.png",
                height: 45.h,
                width: 94.w,
                fit: .contain,
                color: AppColors.primaryColor.withValues(alpha: 0.75),
              ),
              //
              Row(
                children: [
                  GestureDetector(
                    onTap: () => context.pushNamed(Routes.notificationScreen),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: .all(
                          color: AppColors.primaryColor,
                          width: 1.5.w,
                        ),
                        shape: .circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svgs/notification.svg",
                          colorFilter: .mode(AppColors.primaryColor, .srcIn),
                          width: 22.w,
                        ),
                      ),
                    ),
                  ),
                  //
                  horizontalSpace(8),
                  //
                  GestureDetector(
                    onTap: () => context.pushNamed(Routes.userScreen),
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: .all(
                          color: AppColors.primaryColor,
                          width: 1.5.w,
                        ),
                        shape: .circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/svgs/user.svg",
                          colorFilter: .mode(AppColors.primaryColor, .srcIn),
                          width: 22.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //
        verticalSpace(2),
        //
        Divider(thickness: 1.h, color: AppColors.greyColor),
      ],
    );
  }
}
