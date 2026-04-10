import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_fonts.dart';
import '../../../../core/widgets/custom_favorite_button.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';

class CustomFavoriteCarCard extends StatelessWidget {
  const CustomFavoriteCarCard({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.type,
    required this.location,
    required this.price,
    required this.press,
    required this.itemId,
  });

  final String imageSrc, title, type, location, price;
  final VoidCallback press;
  final String itemId;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: press,
      padding: .zero,
      child: Container(
        width: 160.w,
        height: 210.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF0F0F0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.greyColor),
            borderRadius: .circular(15.r),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
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
                        imageUrl: imageSrc,
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
                  Positioned(
                    top: 5.r,
                    right: 5.r,
                    child: CustomFavoriteButton(
                      itemId: itemId,
                      name: title,
                      condition: type,
                      dealershipName: location,
                      price: int.tryParse(price) ?? 0,
                      imageUrl: imageSrc,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: .infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .only(
                    bottomLeft: .circular(15.r),
                    bottomRight: .circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: .all(10.r),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: AppFonts.font14DarkSemiBold.copyWith(
                          overflow: .ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/car_status.svg",
                            colorFilter: const .mode(Color(0xff767676), .srcIn),
                            width: 14.w,
                          ),
                          horizontalSpace(8),
                          Text(
                            type,
                            maxLines: 1,
                            style: AppFonts.font12GreyRegular.copyWith(
                              overflow: .ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/location.svg",
                            colorFilter: const .mode(Color(0xff767676), .srcIn),
                            width: 14.w,
                          ),
                          horizontalSpace(8),
                          Text(
                            location,
                            maxLines: 1,
                            style: AppFonts.font12GreyRegular.copyWith(
                              overflow: .ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/money.svg",
                            colorFilter: const .mode(Color(0xff767676), .srcIn),
                            width: 14.w,
                          ),
                          horizontalSpace(8),
                          Text(
                            price,
                            maxLines: 1,
                            style: AppFonts.font12GreyRegular.copyWith(
                              overflow: .ellipsis,
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
      ),
    );
  }
}
