import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/favorite/presentation/widgets/favorite_cars_grid_view.dart';
import 'package:carzo/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/themes/app_fonts.dart';
import '../../data/models/favorite_car_model.dart';
import '../../manager/favorite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            //
            CustomAppBar(),
            //
            Expanded(
              child: Padding(
                padding: .symmetric(horizontal: 18.w),
                child: BlocConsumer<FavoriteCubit, List<FavoriteCarModel>>(
                  listener: (context, state) {},
                  builder: (context, favoriteCars) {
                    if (favoriteCars.isEmpty) {
                      return Center(
                        child: Text(
                          "No favorite cars yet",
                          style: AppFonts.font16DarkSemiBold,
                        ),
                      );
                    }
                    return FavoriteCarsGridView(favoriteCars: favoriteCars);
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
