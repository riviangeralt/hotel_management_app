import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/features/auth/screens/forgot_pin/widgets/forgot_pin_footer.dart';
import 'package:hotel_booking_app/features/auth/screens/forgot_pin/widgets/forgot_pin_form.dart';
import 'package:hotel_booking_app/features/auth/screens/login/login.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class ForgotPinScreen extends StatelessWidget {
  const ForgotPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Forgot Pin',
        onBack: () => Get.offAll(() => const LoginScreen()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 18.0,
        ),
        child: Column(
          children: [
            Text(
              'Please enter your email address to reset your pincode',
              style: AppTextStyles.applyTextStyles(
                styles: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const ForgotPinForm(),
          ],
        ),
      ),
      bottomNavigationBar: const ForgotPinFooter(),
    );
  }
}
