import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/spacing.dart';
import '../themes/app_fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Center(child: Image.asset("assets/images/error_page.png")),
          Text("An Error Occurred.", style: AppFonts.font18DarkSemiBold),
          //
          verticalSpace(16),
          //
          Text(
            "An error occurred while loading page.\nPlease try again later.",
            textAlign: .center,
            style: AppFonts.font14GreyRegular,
          ),
          //
          verticalSpace(12),
          //
          Text(
            errorText,
            textAlign: .center,
            style: AppFonts.font14GreyRegular,
          ),
          //
        ],
      ),
    );
  }
}
