import 'package:carzo/carzo_app.dart';
import 'package:carzo/core/di/dependency_injection.dart';
import 'package:carzo/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(CarzoApp(appRouter: AppRouter()));
}
