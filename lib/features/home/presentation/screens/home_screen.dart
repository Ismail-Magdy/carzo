import 'package:carzo/core/themes/app_colors.dart';
import 'package:carzo/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(children: [CustomAppBar()]),
        ),
      ),
    );
  }
}
