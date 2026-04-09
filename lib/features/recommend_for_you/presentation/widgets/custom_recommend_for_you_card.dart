import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_fonts.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';

class CustomRecommendForYouCard extends StatelessWidget {
  const CustomRecommendForYouCard({
    super.key,
    required this.title,
    required this.image,
    required this.type,
    required this.location,
    required this.price,
    required this.onTap,
    required this.itemId,
  });

  final String title;
  final String image;
  final String type;
  final String location;
  final String price;
  final void Function() onTap;
  final String itemId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Background Container
      child: Container(
        margin: .symmetric(horizontal: 18.w, vertical: 6.h),
        width: .infinity,
        height: 110.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(15),
          border: .all(width: 1.w, color: AppColors.greyColor),
        ),
        //
        child: Padding(
          padding: .only(right: 14.w),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              // Image Container
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryGreyColor,
                  borderRadius: .circular(15.r),
                ),
                child: ClipRRect(
                  borderRadius: .circular(12.r),
                  // Image
                  child: CachedNetworkImage(
                    imageUrl: image,
                    width: 155.w,
                    height: 106.5.h,
                    fit: .cover,
                    placeholder: (context, url) {
                      return const Center(child: CustomProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return Center(
                        child: Image.asset(
                          "assets/images/master/carzo_logo.png",
                          width: 100.w,
                          fit: .contain,
                        ),
                      );
                    },
                  ),
                  //
                ),
              ),
              //
              Padding(
                padding: .symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .spaceAround,
                  children: [
                    // Title
                    Text(
                      title.length > 10
                          ? "${title.substring(0, 10)}..."
                          : title,
                      maxLines: 1,
                      style: AppFonts.font14DarkSemiBold.copyWith(
                        overflow: .ellipsis,
                      ),
                    ),
                    // Type
                    Row(
                      children: [
                        // Type Static Icon
                        SvgPicture.asset(
                          "assets/svgs/car_status.svg",
                          colorFilter: const .mode(Color(0xff767676), .srcIn),
                          width: 18.w,
                        ),
                        //
                        horizontalSpace(8),
                        // Type Text
                        Text(
                          type,
                          maxLines: 1,
                          style: AppFonts.font12GreyRegular.copyWith(
                            overflow: .ellipsis,
                          ),
                        ),
                        //
                      ],
                    ),
                    // Location
                    Row(
                      children: [
                        // Location Static Icon
                        SvgPicture.asset(
                          "assets/svgs/location.svg",
                          colorFilter: const .mode(Color(0xff767676), .srcIn),
                          width: 18.w,
                        ),
                        //
                        horizontalSpace(8),
                        // Location Text
                        Text(
                          location.length > 10
                              ? "${location.substring(0, 10)}..."
                              : location,
                          maxLines: 1,
                          style: AppFonts.font12GreyRegular.copyWith(
                            overflow: .ellipsis,
                          ),
                        ),
                        //
                      ],
                    ),
                    // Price
                    Row(
                      children: [
                        // Price Static Icon
                        SvgPicture.asset(
                          "assets/svgs/money.svg",
                          colorFilter: const .mode(Color(0xff767676), .srcIn),
                          width: 18.w,
                        ),
                        //
                        horizontalSpace(8),
                        // Price Text
                        Text(
                          price.length > 10
                              ? "${price.substring(0, 10)}..."
                              : price,
                          maxLines: 1,
                          style: AppFonts.font12GreyRegular.copyWith(
                            overflow: .ellipsis,
                          ),
                        ),
                        //
                      ],
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/heart.svg",
                colorFilter: const .mode(AppColors.greyColor, .srcIn),
                width: 18.w,
              ),
              //
              // TODO:
              // CustomFavoriteButton(
              //   itemId: itemId,
              //   name: title,
              //   condition: type,
              //   dealershipName: location,
              //   price: int.tryParse(price) ?? 0,
              //   imageUrl: image,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
