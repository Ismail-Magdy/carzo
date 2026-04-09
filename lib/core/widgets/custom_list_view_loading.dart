import 'package:carzo/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import '../helpers/spacing.dart';

class CustomListViewLoading extends StatelessWidget {
  const CustomListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ListView Details
      itemCount: 8,
      physics: const BouncingScrollPhysics(),
      padding: .only(top: 8.h, bottom: 28.h),
      // ListView Item
      itemBuilder: (context, index) {
        // Background Container
        return Container(
          margin: .symmetric(horizontal: 18.w, vertical: 6.h),
          width: .infinity,
          height: 110.h,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: .all(width: 1.w, color: AppColors.greyColor),
            borderRadius: .circular(15.r),
          ),
          //
          child: Padding(
            padding: .only(right: 14.w),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                // Shimmer Image
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.4),
                  highlightColor: AppColors.whiteColor,
                  child: Container(
                    width: 155.w,
                    height: .infinity,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withValues(alpha: 0.4),
                      borderRadius: .circular(15),
                    ),
                  ),
                ),
                //
                horizontalSpace(2),
                // Details Column
                Padding(
                  padding: .symmetric(vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceAround,
                    children: [
                      // Shimmer Title
                      Shimmer.fromColors(
                        baseColor: AppColors.greyColor.withValues(alpha: 0.4),
                        highlightColor: AppColors.whiteColor,
                        child: Container(
                          height: 14.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                            color: AppColors.greyColor.withValues(alpha: 0.4),
                            borderRadius: .circular(8),
                          ),
                        ),
                      ),
                      //
                      Row(
                        children: [
                          // Shimmer Type Icon
                          Shimmer.fromColors(
                            baseColor: AppColors.greyColor.withValues(
                              alpha: 0.4,
                            ),
                            highlightColor: AppColors.whiteColor,
                            child: Container(
                              height: 14.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor.withValues(
                                  alpha: 0.4,
                                ),
                                borderRadius: .circular(8),
                              ),
                            ),
                          ),
                          //
                          horizontalSpace(8),
                          // Shimmer Type Text
                          Shimmer.fromColors(
                            baseColor: AppColors.greyColor.withValues(
                              alpha: 0.4,
                            ),
                            highlightColor: AppColors.whiteColor,
                            child: Container(
                              height: 14.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor.withValues(
                                  alpha: 0.4,
                                ),
                                borderRadius: .circular(8),
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                      // Location
                      Row(
                        children: [
                          // Shimmer Location Icon
                          Shimmer.fromColors(
                            baseColor: AppColors.greyColor.withValues(
                              alpha: 0.4,
                            ),
                            highlightColor: AppColors.whiteColor,
                            child: Container(
                              height: 14.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor.withValues(
                                  alpha: 0.4,
                                ),
                                borderRadius: .circular(8),
                              ),
                            ),
                          ),
                          //
                          horizontalSpace(8),
                          // Shimmer Location Text
                          Shimmer.fromColors(
                            baseColor: AppColors.greyColor.withValues(
                              alpha: 0.4,
                            ),
                            highlightColor: AppColors.whiteColor,
                            child: Container(
                              height: 14.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor.withValues(
                                  alpha: 0.4,
                                ),
                                borderRadius: .circular(8),
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                      // Price
                      Row(
                        children: [
                          // Shimmer Price Icon
                          Shimmer.fromColors(
                            baseColor: AppColors.greyColor.withValues(
                              alpha: 0.4,
                            ),
                            highlightColor: AppColors.whiteColor,
                            child: Container(
                              height: 14.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor.withValues(
                                  alpha: 0.4,
                                ),
                                borderRadius: .circular(8),
                              ),
                            ),
                          ),
                          //
                          horizontalSpace(8),
                          // Shimmer Price Text
                          Shimmer.fromColors(
                            baseColor: AppColors.greyColor.withValues(
                              alpha: 0.4,
                            ),
                            highlightColor: AppColors.whiteColor,
                            child: Container(
                              height: 14.h,
                              width: 55.w,
                              decoration: BoxDecoration(
                                color: AppColors.greyColor.withValues(
                                  alpha: 0.4,
                                ),
                                borderRadius: .circular(8),
                              ),
                            ),
                          ),
                          //
                        ],
                      ),
                      //
                    ],
                  ),
                ),
                // Favorite Button Shimmer
                Shimmer.fromColors(
                  baseColor: AppColors.greyColor.withValues(alpha: 0.4),
                  highlightColor: AppColors.whiteColor,
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
                //
              ],
            ),
          ),
        );
      },
    );
  }
}
