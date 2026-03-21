import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/features/home/presentation/widgets/custom_drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/themes/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          //
          Padding(
            padding: .only(top: 30.h, right: 15.w),
            child: Align(
              alignment: .centerRight,
              child: GestureDetector(
                onTap: () => scaffoldKey.currentState?.closeDrawer(),
                child: SvgPicture.asset(
                  "assets/svgs/close-square.svg",
                  height: 30.h,
                  width: 30.w,
                  colorFilter: const .mode(AppColors.textColor, .srcIn),
                ),
              ),
            ),
          ),
          //
          verticalSpace(30),
          //
          CustomDrawerItem(
            title: "New Cars",
            icon: "assets/svgs/car-brand.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
          verticalSpace(15),
          //
          CustomDrawerItem(
            title: "Used Cars",
            icon: "assets/svgs/walk-car.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
          verticalSpace(15),
          //
          CustomDrawerItem(
            title: "Sell Car",
            icon: "assets/svgs/sell-car.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
          verticalSpace(15),
          //
          CustomDrawerItem(
            title: "Car\nShowrooms",
            icon: "assets/svgs/company.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
          verticalSpace(15),
          //
          CustomDrawerItem(
            title: "Insurance\nCompanies",
            icon: "assets/svgs/insurance-companey.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
          verticalSpace(15),
          //
          CustomDrawerItem(
            title: "Maintenance\nCompanies",
            icon: "assets/svgs/mainainance-companies.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
          verticalSpace(15),
          //
          CustomDrawerItem(
            title: "Rescue\nCompanies",
            icon: "assets/svgs/rescue-companies.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
          verticalSpace(15),
          //
          CustomDrawerItem(
            title: "Setting",
            icon: "assets/svgs/setting.svg",
            onTap: () {
              // TODO: Navigate to Related Screen
              scaffoldKey.currentState?.closeDrawer();
            },
          ),
          //
        ],
      ),
    );
  }
}
