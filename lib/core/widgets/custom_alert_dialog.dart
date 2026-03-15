import 'package:carzo/core/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/spacing.dart';

class CustomAlertDialog extends StatelessWidget {
  final String dialogHeader;
  final String dialogBody;
  final Color dialogColor;
  final IconData dialogIcon;
  final void Function() onPressed;

  const CustomAlertDialog({
    super.key,
    required this.dialogIcon,
    required this.dialogHeader,
    required this.dialogBody,
    required this.dialogColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: dialogColor,
      shape: RoundedRectangleBorder(borderRadius: .circular(20.r)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: .all(20.r),
        child: Column(
          mainAxisSize: .min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                shape: .circle,
              ),
              padding: .all(10.r),
              child: Icon(dialogIcon, color: Colors.white, size: 40.r),
            ),
            verticalSpace(10),
            Text(
              dialogHeader,
              style: AppFonts.font18DarkBold.copyWith(color: Colors.white),
            ),
            verticalSpace(10),
            Text(
              dialogBody,
              textAlign: .center,
              style: AppFonts.font15DarkMedium.copyWith(color: Colors.white),
            ),
            verticalSpace(20),
            SizedBox(
              width: .infinity,
              child: TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: .symmetric(vertical: 12.r),
                  shape: RoundedRectangleBorder(borderRadius: .circular(10)),
                ),
                child: Text(
                  "OK",
                  style: AppFonts.font15DarkMedium.copyWith(color: dialogColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
