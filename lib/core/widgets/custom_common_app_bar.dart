import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCommonAppBar extends StatelessWidget {
  final String text;
  const CustomCommonAppBar({super.key, required this.text});

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
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: .all(color: AppColors.greyColor, width: 1.5.w),
                  shape: .circle,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: SvgPicture.asset(
                      "assets/svgs/arrow-left.svg",
                      colorFilter: .mode(AppColors.primaryColor, .srcIn),
                      width: 22.w,
                    ),
                  ),
                ),
              ),
              //
              Text(text, style: AppFonts.font18DarkBold),
              //
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: .all(color: AppColors.greyColor, width: 1.5.w),
                  shape: .circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/svgs/more.svg",
                    colorFilter: .mode(AppColors.primaryColor, .srcIn),
                    width: 22.w,
                  ),
                ),
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
