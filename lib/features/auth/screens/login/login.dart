import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/features/auth/screens/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Login',
        showBack: false,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 36.h,
          left: 18.w,
          right: 18.w,
        ),
        child: const LoginForm(),
      ),
    );
  }
}
