import 'package:carzo/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/routes/routes.dart';
import '../../data/models/favorite_car_model.dart';
import 'custom_favorite_car_card.dart';

class FavoriteCarsGridView extends StatelessWidget {
  final List<FavoriteCarModel> favoriteCars;

  const FavoriteCarsGridView({super.key, required this.favoriteCars});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: favoriteCars.length,
      //
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: .only(bottom: 12.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: MediaQuery.sizeOf(context).height * 0.28,
      ),
      //
      itemBuilder: (_, index) {
        final car = favoriteCars[index];
        return CustomFavoriteCarCard(
          image: car.url?.isNotEmpty == true ? car.url!.first.url ?? "" : "",
          title: car.carName ?? "Unknown",
          type: car.condition ?? "Unknown",
          location: car.dealershipName ?? "Unknown",
          price: car.price?.toString() ?? "N/A",
          itemId: car.carId?.toString() ?? "",
          onTap: () {
            carDetailsStatus = car.condition ?? "Unknown";
            carDetailsId = car.carId.toString();
            // Navigate to car details screen
            context.pushNamed(Routes.carDetailsScreen);
          },
        );
      },
    );
  }
}
