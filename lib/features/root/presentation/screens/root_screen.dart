import 'package:carzo/features/chat/chat_screen.dart';
import 'package:carzo/core/helpers/spacing.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/favorite/favorite_screen.dart';
import 'package:carzo/features/home/presentation/screens/home_screen.dart';
import 'package:carzo/features/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  //
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreen(),
    const ChatScreen(),
  ];
  //
  int currentIndex = 0;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      //
      bottomNavigationBar: Padding(
        padding: .only(left: 15.w, right: 15.w, bottom: 20.h),
        child: Container(
          height: 75.h,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: .circular(40.r),
          ),
          child: Row(
            mainAxisAlignment: .spaceAround,
            children: [
              // Home Item
              customIconNavigationBar(
                index: 0,
                icon: "assets/svgs/home.svg",
                title: "Home",
              ),
              // Search Item
              customIconNavigationBar(
                index: 1,
                icon: "assets/svgs/search-normal.svg",
                title: "Search",
              ),
              // Favorite Item
              customIconNavigationBar(
                index: 2,
                icon: "assets/svgs/heart.svg",
                title: "Favorite",
              ),
              // Chat Item
              customIconNavigationBar(
                index: 3,
                icon: "assets/svgs/message-text.svg",
                title: "Chat",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Icon Navigation Bar

  Widget customIconNavigationBar({
    required int index,
    required String icon,
    required String title,
  }) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: .center,
        children: [
          isSelected
              ? CircleAvatar(
                  backgroundColor: const Color(
                    0xffB9E5E8,
                  ).withValues(alpha: 0.4),
                  child: SvgPicture.asset(
                    icon,
                    colorFilter: const .mode(Colors.white, .srcIn),
                  ),
                )
              : SvgPicture.asset(
                  icon,
                  colorFilter: const .mode(Colors.white, .srcIn),
                ),
          verticalSpace(isSelected ? 5 : 10),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
