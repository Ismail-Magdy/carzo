import 'package:carzo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_fonts.dart';

class CustomSearchAndDrawer extends StatefulWidget {
  const CustomSearchAndDrawer({
    super.key,
    required this.scaffoldKey,
    required this.onTap,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final void Function() onTap;

  @override
  State<CustomSearchAndDrawer> createState() => _CustomSearchAndDrawerState();
}

class _CustomSearchAndDrawerState extends State<CustomSearchAndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 18.w),
      child: Row(
        children: [
          //
          GestureDetector(
            onTap: () => widget.scaffoldKey.currentState?.openDrawer(),
            child: Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                shape: .circle,
                color: Colors.white,
                border: .all(color: AppColors.greyColor, width: 1.w),
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/svgs/menu.svg",
                  colorFilter: .mode(Color(0xff767676), .srcIn),
                ),
              ),
            ),
          ),
          //
          horizontalSpace(22),
          //
          Expanded(
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: .all(width: 1, color: Color(0xFFD7D7D7)),
                  borderRadius: .circular(10),
                ),
                child: Padding(
                  padding: .symmetric(horizontal: 20.r),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/search-normal.svg',
                        colorFilter: const .mode(Color(0xff767676), .srcIn),
                      ),
                      //
                      horizontalSpace(12),
                      //
                      Text(
                        'Search your dream car.....',
                        style: AppFonts.font14GreyRegular,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
