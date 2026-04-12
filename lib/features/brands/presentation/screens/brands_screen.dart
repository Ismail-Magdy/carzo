import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/themes/app_fonts.dart';
import 'package:carzo/core/widgets/custom_common_app_bar.dart';
import 'package:carzo/features/brands/manager/all_brands_cubit.dart';
import 'package:carzo/features/brands/manager/all_brands_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/constants.dart';
import '../../../../core/widgets/custom_brand_grid_view_loading.dart';
import '../../../../core/widgets/error_screen.dart';
import '../widgets/custom_brands_item.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            CustomCommonAppBar(text: "Brands"),
            //
            Expanded(
              child: BlocBuilder<AllBrandsCubit, AllBrandsState>(
                builder: (context, state) {
                  return state.when(
                    //
                    idle: () =>
                        const Center(child: CustomBrandGridViewLoading()),
                    //
                    loading: () =>
                        const Center(child: CustomBrandGridViewLoading()),
                    //
                    success: (allBrands) {
                      // Check if the list is empty
                      if (allBrands.isEmpty) {
                        return Center(
                          child: Text(
                            "No Brands Available",
                            style: AppFonts.font16DarkSemiBold,
                          ),
                        );
                      }
                      // Display the grid of brands
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: .vertical,
                        padding: .all(20.r),
                        itemCount: allBrands.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          final brand = allBrands[index];
                          //
                          return CustomBrandsItem(
                            brandImage: brand.pictureUrl,
                            brandName: brand.name,
                            // Navigate to car brand screen
                            onTap: () {
                              masterBrandName = brand.name;
                              context.pushNamed(Routes.carBrandScreen);
                            },
                          );
                        },
                      );
                      //
                    },
                    failure: (error) => ErrorScreen(errorText: "Error $error"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
