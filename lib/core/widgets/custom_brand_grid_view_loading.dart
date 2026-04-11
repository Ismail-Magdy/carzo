import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomBrandGridViewLoading extends StatelessWidget {
  const CustomBrandGridViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: .vertical,
      padding: .all(20.r),
      itemCount: 30,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            // Brand Image with a circular background
            Shimmer.fromColors(
              baseColor: AppColors.greyColor.withValues(alpha: 0.4),
              highlightColor: AppColors.whiteColor,
              child: Container(
                height: 60.h,
                width: 60.w,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: .circle,
                ),
              ),
            ),
            //
            verticalSpace(10),
            //
            Center(
              child: Shimmer.fromColors(
                baseColor: AppColors.greyColor.withValues(alpha: 0.4),
                highlightColor: AppColors.whiteColor,
                child: Container(
                  height: 20.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: .all(.circular(20.r)),
                  ),
                ),
              ),
            ),
            //
          ],
        );
      },
    );
  }
}
