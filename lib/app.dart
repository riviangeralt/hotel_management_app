import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hotel_booking_app/features/auth/screens/login/login.dart';
import 'package:hotel_booking_app/utils/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(
            1.0,
          ),
        ),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
