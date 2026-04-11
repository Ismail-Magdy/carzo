import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/widgets/custom_common_app_bar.dart';
import 'package:carzo/core/widgets/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_list_view_loading.dart';
import '../../data/models/all_cars_model.dart';
import '../../manager/all_cars_cubit.dart';
import '../../manager/all_cars_state.dart';
import '../widgets/custom_recommend_for_you_card.dart';

class RecommendForYouScreen extends StatelessWidget {
  const RecommendForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      //
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            CustomCommonAppBar(text: "Recommend For You"),
            //
            Expanded(
              child:
                  BlocBuilder<AllCarsCubit, AllCarsState<List<AllCarsModel>>>(
                    builder: (context, state) {
                      return state.when(
                        //Idle State
                        idle: () =>
                            const Center(child: CustomListViewLoading()),
                        // Loading State
                        loading: () =>
                            const Center(child: CustomListViewLoading()),
                        // Success State
                        success: (allCars) {
                          return ListView.builder(
                            // ListView Details
                            itemCount: allCars.length,
                            physics: const BouncingScrollPhysics(),
                            padding: .only(top: 8.h, bottom: 28.h),
                            //ListView Item
                            itemBuilder: (context, index) {
                              return CustomRecommendForYouCard(
                                image: allCars[index].url!.first.url ?? "",
                                title: allCars[index].carName ?? "Unknown Car",
                                type: allCars[index].status ?? "Unknown",
                                location:
                                    allCars[index].dealershipName ?? "Unknown",
                                price:
                                    allCars[index].price?.toString() ?? "N/A",
                                itemId: allCars[index].carId.toString(),
                                // on Tap
                                onTap: () {
                                  carDetailsStatus =
                                      allCars[index].status ?? "Unknown";
                                  carDetailsId = allCars[index].carId
                                      .toString();
                                  // Navigate to Car Details Screen
                                  context.pushNamed(Routes.carDetailsScreen);
                                },
                              );
                            },
                          );
                        },
                        failure: (error) {
                          return ErrorScreen(errorText: "Error $error");
                        },
                      );
                    },
                  ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
