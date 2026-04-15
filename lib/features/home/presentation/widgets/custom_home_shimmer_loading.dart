import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_colors.dart';

class CustomHomeShimmerLoading extends StatelessWidget {
  const CustomHomeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        CustomHomeShimmerLoadingCard(),
        CustomHomeShimmerLoadingCard(),
      ],
    );
  }
}

class CustomHomeShimmerLoadingCard extends StatelessWidget {
  const CustomHomeShimmerLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 220.h,
      decoration: BoxDecoration(
        color: AppColors.secondaryGreyColor,
        border: .all(width: 1, color: AppColors.greyColor),
        borderRadius: .circular(15),
      ),

      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.secondaryGreyColor,
                  highlightColor: AppColors.greyColor,
                  child: Container(
                    width: .infinity,
                    height: 130.h,
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryGreyColor,
                      borderRadius: .only(
                        topLeft: .circular(15),
                        topRight: .circular(15),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      shape: .circle,
                      border: .all(width: 1.5, color: AppColors.greyColor),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/svgs/heart.svg",
                        width: 15.w,
                        height: 15.h,
                        colorFilter: const .mode(AppColors.greyColor, .srcIn),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: .infinity,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: .only(
                  bottomLeft: .circular(15),
                  bottomRight: .circular(15),
                ),
              ),
              child: Padding(
                padding: .all(10.r),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                      highlightColor: AppColors.whiteColor,
                      child: Container(
                        height: 14.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                          highlightColor: AppColors.whiteColor,
                          child: Container(
                            height: 14.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Shimmer.fromColors(
                          baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                          highlightColor: AppColors.whiteColor,
                          child: Container(
                            height: 14.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.3),
                              borderRadius: .circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                          highlightColor: AppColors.whiteColor,
                          child: Container(
                            height: 14.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.3),
                              borderRadius: .circular(8.r),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Shimmer.fromColors(
                          baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                          highlightColor: AppColors.whiteColor,
                          child: Container(
                            height: 14.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.3),
                              borderRadius: .circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //
                    Row(
                      children: [
                        Shimmer.fromColors(
                          baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                          highlightColor: AppColors.whiteColor,
                          child: Container(
                            height: 14.h,
                            width: 16.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.3),
                              borderRadius: .circular(8.r),
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Shimmer.fromColors(
                          baseColor: AppColors.greyColor.withValues(alpha: 0.3),
                          highlightColor: AppColors.whiteColor,
                          child: Container(
                            height: 14.h,
                            width: 65.w,
                            decoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.3),
                              borderRadius: .circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//212