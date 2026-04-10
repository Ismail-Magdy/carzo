import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/favorite/data/models/favorite_car_model.dart';
import 'package:carzo/features/favorite/manager/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomFavoriteButton extends StatelessWidget {
  final String itemId;
  final String name;
  final String condition;
  final String dealershipName;
  final int price;
  final String imageUrl;

  const CustomFavoriteButton({
    super.key,
    required this.itemId,
    required this.name,
    required this.condition,
    required this.dealershipName,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, List<FavoriteCarModel>>(
      builder: (context, favoriteItems) {
        final isFavorite = favoriteItems.any(
          (favCar) => favCar.carId.toString() == itemId,
        );

        return GestureDetector(
          onTap: () {
            final car = FavoriteCarModel(
              carId: int.tryParse(itemId),
              carName: name,
              condition: condition,
              dealershipName: dealershipName,
              price: price,
              url: [Url(url: imageUrl)],
            );
            context.read<FavoriteCubit>().toggleFavorite(car);
          },
          child: Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              shape: .circle,
              border: .all(
                color: isFavorite ? Colors.red : AppColors.greyColor,
                width: 1.5,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                isFavorite
                    ? "assets/svgs/solid-heart.svg"
                    : "assets/svgs/heart.svg",
                width: 15.w,
                height: 15.h,
                colorFilter: .mode(
                  isFavorite ? Colors.red : const Color(0xff767676),
                  .srcIn,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
