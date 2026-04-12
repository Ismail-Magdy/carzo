import 'package:carzo/core/widgets/custom_common_app_bar.dart';
import 'package:carzo/features/car_brand/manager/car_brand_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/custom_grid_view_loading.dart';
import '../../../../core/widgets/error_screen.dart';
import '../../manager/car_brand_state.dart';
import '../widgets/car_brand_grid_view.dart';
import '../widgets/no_cars_available.dart';

class CarBrandScreen extends StatelessWidget {
  const CarBrandScreen({super.key, required this.brandName});
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // AppBar
            CustomCommonAppBar(text: brandName),
            //
            Expanded(
              child: Padding(
                padding: .symmetric(horizontal: 18.w),
                child: BlocBuilder<CarBrandCubit, CarBrandState>(
                  builder: (context, state) {
                    return state.when(
                      //
                      idle: () => const Center(child: CustomGridViewLoading()),
                      //
                      loading: () =>
                          const Center(child: CustomGridViewLoading()),
                      //
                      success: (carBrandsList) {
                        if (carBrandsList.isEmpty) {
                          return NoCarsAvailable();
                        }
                        return CarBrandGridView(
                          brandName: brandName,
                          carBrandsList: carBrandsList,
                        );
                      },
                      //
                      failure: (error) =>
                          ErrorScreen(errorText: "Error $error"),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
