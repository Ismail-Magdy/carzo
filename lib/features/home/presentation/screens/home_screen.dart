import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:carzo/features/home/presentation/widgets/custom_drawer.dart';
import 'package:carzo/features/home/presentation/widgets/custom_two_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/app_fonts.dart';
import '../widgets/custom_brands_row.dart';
import '../widgets/custom_search_and_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.mainBackgroundColor,
      //
      drawer: Drawer(
        backgroundColor: AppColors.whiteColor,
        width: 280.w,
        child: CustomDrawer(scaffoldKey: _scaffoldKey),
      ),
      //
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              //
              CustomAppBar(),
              //
              verticalSpace(5),
              //
              CustomSearchAndDrawer(scaffoldKey: _scaffoldKey, onTap: () {}),
              //
              verticalSpace(30),
              //
              CustomTwoTexts(
                leftText: "Brands",
                onTap: () {
                  //  Navigate to Related Screen
                  context.pushNamed(Routes.brandsScreen);
                },
              ),
              //
              verticalSpace(25),
              //
              CustomBrandsRow(),
              //
              verticalSpace(25),
              //
              Container(
                padding: .all(15.r),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: .only(
                    topLeft: .circular(30),
                    topRight: .circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    //
                    CustomTwoTexts(
                      leftText: "Recommend For You",
                      onTap: () {
                        context.pushNamed(Routes.recommendForYouScreen);
                      },
                    ),
                    //
                    verticalSpace(10),
                    //
                    Padding(
                      padding: .only(left: 15.w),
                      child: Align(
                        alignment: .centerLeft,
                        child: Text(
                          "Available",
                          style: AppFonts.font14GreyRegular,
                        ),
                      ),
                    ),
                    //
                    verticalSpace(14),
                    //
                    CustomTwoTexts(
                      leftText: "Our Services",
                      onTap: () {
                        // TODO :
                        // context.pushNamed(Routes.ourServicesView);
                      },
                    ),
                    //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
