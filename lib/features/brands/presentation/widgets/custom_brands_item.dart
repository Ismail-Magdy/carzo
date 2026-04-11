import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_fonts.dart';

class CustomBrandsItem extends StatelessWidget {
  const CustomBrandsItem({
    super.key,
    required this.onTap,
    required this.brandImage,
    required this.brandName,
  });
  final void Function() onTap;
  final String? brandImage;
  final String? brandName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Brand Image with a circular background
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60.h,
            width: 60.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: .circle,
            ),
            // Brand Image
            child: Center(
              child: CachedNetworkImage(
                imageUrl: brandImage ?? "",
                fit: .contain,
                height: 35.h,
                width: 35.w,
                color: AppColors.whiteColor,
                errorWidget: (context, url, error) => const Icon(
                  Icons.directions_car,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            //
          ),
        ),
        //
        verticalSpace(13),
        // Brand Name
        Text(
          brandName ?? "Unknown",
          style: AppFonts.font12DarkBold,
          maxLines: 1,
          overflow: .ellipsis,
        ),
        //
      ],
    );
  }
}
