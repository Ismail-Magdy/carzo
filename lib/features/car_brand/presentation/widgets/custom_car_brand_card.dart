import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_fonts.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';

class CustomCarBrandCard extends StatelessWidget {
  const CustomCarBrandCard({
    super.key,
    required this.image,
    required this.title,
    required this.type,
    required this.location,
    required this.price,
    required this.onTap,
    required this.itemId,
  });

  final String image;
  final String title;
  final String type;
  final String location;
  final String price;
  final Function() onTap;
  final String itemId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Card Shape
      child: Container(
        width: 160.w,
        height: 210.h,
        decoration: BoxDecoration(
          color: AppColors.secondaryGreyColor,
          border: .all(width: 1, color: AppColors.greyColor),
          borderRadius: .circular(15.r),
        ),
        //
        child: Column(
          children: [
            // Image Section
            Expanded(
              child: Stack(
                children: [
                  // Image with placeholder and error handling
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryGreyColor,
                      borderRadius: .only(
                        topLeft: .circular(15.r),
                        topRight: .circular(15.r),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: .only(
                        topLeft: .circular(15.r),
                        topRight: .circular(15.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: .cover,
                        width: .infinity,
                        height: .infinity,
                        placeholder: (context, url) =>
                            const Center(child: CustomProgressIndicator()),
                        errorWidget: (context, url, error) => Center(
                          child: Image.asset(
                            "assets/images/master/carzo_logo.png",
                            width: 100.w,
                            fit: .contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //
                  // Favorite Button
                  Positioned(
                    top: 5.h,
                    right: 5.w,
                    child: CustomFavoriteButton(
                      itemId: itemId,
                      name: title,
                      condition: type,
                      dealershipName: location,
                      price: int.tryParse(price) ?? 0,
                      imageUrl: image,
                    ),
                  ),
                  //
                ],
              ),
            ),
            //
            // Details Section
            Expanded(
              child: Container(
                width: .infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: .only(
                    bottomLeft: .circular(15.r),
                    bottomRight: .circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: .all(10.r),
                  // Details Column
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      // Title
                      Text(
                        title,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: AppFonts.font14DarkSemiBold,
                      ),
                      //
                      // Type
                      Row(
                        children: [
                          // Type Icon
                          SvgPicture.asset(
                            "assets/svgs/car_status.svg",
                            colorFilter: const .mode(Color(0xff767676), .srcIn),
                            width: 14.w,
                          ),
                          horizontalSpace(8),
                          // Type Text
                          Text(
                            type,
                            maxLines: 1,
                            overflow: .ellipsis,
                            style: AppFonts.font12GreyRegular,
                          ),
                        ],
                      ),
                      //
                      // Location
                      Row(
                        children: [
                          // Location Icon
                          SvgPicture.asset(
                            width: 14.w,
                            "assets/svgs/location.svg",
                            colorFilter: const .mode(
                              AppColors.drawerColor,
                              .srcIn,
                            ),
                          ),
                          horizontalSpace(8),
                          // Location Text
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: .ellipsis,
                              style: AppFonts.font12GreyRegular,
                            ),
                          ),
                          //
                        ],
                      ),
                      //
                      // Price
                      Row(
                        children: [
                          // Price Icon
                          SvgPicture.asset(
                            width: 14.w,
                            "assets/svgs/money.svg",
                            colorFilter: const .mode(
                              AppColors.drawerColor,
                              .srcIn,
                            ),
                          ),
                          horizontalSpace(8),
                          // Price Text
                          Text(
                            price,
                            maxLines: 1,
                            overflow: .ellipsis,
                            style: AppFonts.font12GreyRegular,
                          ),
                        ],
                      ),
                      //
                    ],
                  ),
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
