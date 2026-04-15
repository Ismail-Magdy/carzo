import 'package:carzo/features/home/presentation/widgets/custom_available_cars_card.dart';
import 'package:carzo/features/home/presentation/widgets/custom_home_shimmer_error.dart';
import 'package:carzo/features/home/presentation/widgets/custom_home_shimmer_loading.dart';
import 'package:carzo/features/recommend_for_you/data/models/all_cars_model.dart';
import 'package:carzo/features/recommend_for_you/manager/all_cars_cubit.dart';
import 'package:carzo/features/recommend_for_you/manager/all_cars_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/app_colors.dart';

class CustomAvailableListCars extends StatelessWidget {
  const CustomAvailableListCars({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCarsCubit, AllCarsState<List<AllCarsModel>>>(
      builder: (context, state) {
        return state.when(
          idle: () => const CustomHomeShimmerLoading(),
          loading: () => const CustomHomeShimmerLoading(),
          success: (allCars) {
            if (allCars.isEmpty) {
              return const Center(
                child: Text(
                  "No cars available",
                  style: TextStyle(color: AppColors.secondaryTextColor),
                ),
              );
            }
            return Row(
              mainAxisAlignment: .spaceBetween,
              children: allCars.take(2).map((car) {
                return CustomAvailableCarsCard(
                  image: car.url?.isNotEmpty == true
                      ? car.url!.first.url ?? ""
                      : "",
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
              }).toList(),
            );
          },
          failure: (error) {
            return const CustomHomeShimmerError();
          },
        );
      },
    );
  }
}
