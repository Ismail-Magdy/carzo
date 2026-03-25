import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/core/widgets/custom_common_app_bar.dart';
import 'package:flutter/material.dart';

class RecommendForYouScreen extends StatelessWidget {
  const RecommendForYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      //
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [CustomCommonAppBar(text: "Recommend For You")],
          ),
        ),
      ),
    );
  }
}
