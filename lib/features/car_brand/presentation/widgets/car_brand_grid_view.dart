import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/features/car_brand/data/models/car_brand_model.dart';
import 'package:carzo/features/car_brand/presentation/widgets/custom_car_brand_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/routes/routes.dart';

class CarBrandGridView extends StatelessWidget {
  final String brandName;
  final List<CarBrandModel> carBrandsList;

  const CarBrandGridView({
    super.key,
    required this.brandName,
    required this.carBrandsList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: carBrandsList.length,
      //
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: .only(bottom: 12.h, top: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: MediaQuery.sizeOf(context).height * 0.28,
      ),
      //
      itemBuilder: (_, index) {
        final car = carBrandsList[index];
        return CustomCarBrandCard(
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
