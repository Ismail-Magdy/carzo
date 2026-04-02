import 'package:carzo/carzo_app.dart';
import 'package:carzo/core/di/dependency_injection.dart';
import 'package:carzo/core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await SystemChrome.setPreferredOrientations([.portraitUp]);
  //
  await initGetIt();
  //
  await ScreenUtil.ensureScreenSize();
  //
  runApp(CarzoApp(appRouter: AppRouter()));
}

// flutter run --flavor development -t lib/main_development.dart

// flutter run --flavor production -t lib/main_production.dart

// flutter build apk --flavor production -t lib/main_production.dart
