import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_fonts.dart';

class CustomNewCarsSection extends StatelessWidget {
  const CustomNewCarsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.pushNamed(Routes.newCarsScreen);
      },
      padding: .zero,
      child: Container(
        padding: .symmetric(horizontal: 18.w),
        width: .infinity,
        height: 110.h,
        decoration: BoxDecoration(
          color: AppColors.secondaryGreyColor,
          border: .all(color: AppColors.greyColor, width: 1.w),
          borderRadius: .circular(15.r),
        ),
        child: Padding(
          padding: .only(left: 10.w),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text("New Cars", style: AppFonts.font18DarkBold),
              Image.asset(
                "assets/images/photos/new-cars-image.png",
                height: 70.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
