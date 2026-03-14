import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/routes/routes.dart';
import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/get_started/data/models/get_started_model.dart';
import 'package:carzo/features/get_started/presentation/widgets/custom_background_image.dart';
import 'package:carzo/features/get_started/presentation/widgets/custom_button.dart';
import 'package:carzo/features/get_started/presentation/widgets/custom_description.dart';
import 'package:carzo/features/get_started/presentation/widgets/custom_dots.dart';
import 'package:carzo/features/get_started/presentation/widgets/custom_logo.dart';
import 'package:carzo/features/get_started/presentation/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  //
  PageController _pageController = PageController();
  //
  final List<GetStartedModel> screens = [
    GetStartedModel(
      image: "assets/images/photos/get_started_background1.png",
      title: "Welcome to\nCarzo.",
      desc: " ",
    ),
    GetStartedModel(
      image: "assets/images/photos/get_started_background2.png",
      title: "Lets Start...\nFind a perfect and favorite car for you.",
      desc:
          "Discover your next adventure with Carzo. We're here to provide a seamless car sale experience.\n\nLet’s get started on your journey.",
    ),
  ];
  //
  int currentIndex = 0;
  //

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  //

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: PageView.builder(
        itemCount: screens.length,
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // Background Image
              CustomBackgroundImage(
                image: screens[index].image.toString(),
                currentIndex: currentIndex,
              ),
              //
              // All Screen
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: .only(left: 30.w, right: 30.w, bottom: 35.h),
                  child: Column(
                    children: [
                      // Texts
                      GestureDetector(
                        onTap: () {
                          if (currentIndex == 1) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear,
                            );
                          } else {
                            context.pushNamed(Routes.loginScreen);
                          }
                        },
                        child: Align(
                          alignment: .centerRight,
                          child: Text(
                            currentIndex == 0 ? "Skip" : "Back",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      //
                      // Logo
                      const CustomLogo(),
                      //
                      // Title Bold
                      CustomTitle(
                        title: screens[index].title.toString(),
                        currentIndex: currentIndex,
                      ),
                      //
                      const Spacer(),
                      // Desc
                      CustomDescription(
                        description: screens[index].desc.toString(),
                      ),
                      //
                      const Spacer(),
                      //
                      CustomDots(
                        length: screens.length,
                        currentIndex: currentIndex,
                      ),
                      //
                      const Spacer(),
                      //
                      CustomButton(
                        currentIndex: currentIndex,
                        pageController: _pageController,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
