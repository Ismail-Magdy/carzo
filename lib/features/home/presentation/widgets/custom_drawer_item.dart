import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_fonts.dart';

class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final String icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 20.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon, width: 24.w),
                //
                horizontalSpace(10),
                //
                Text(title, style: AppFonts.font18DarkRegular),
              ],
            ),
            //
            SvgPicture.asset("assets/svgs/arrow-right.svg", width: 20.w),
          ],
        ),
      ),
    );
  }
}
