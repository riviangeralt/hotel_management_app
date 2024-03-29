import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/login/login_controller.dart';
import 'package:hotel_booking_app/features/auth/screens/forgot_pin/forgot_pin.dart';
import 'package:hotel_booking_app/navigation/registration_navigation.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:hotel_booking_app/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phone Number',
              style: AppTextStyles.applyTextStyles(
                styles: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
              constraints: BoxConstraints(
                minHeight: 46.h,
              ),
              child: TextFormField(
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
                ],
                controller: controller.phoneController,
                validator: AppValidator.validateMobile,
                decoration: const InputDecoration(
                  hintText: '000 0000 000',
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Pin',
              style: AppTextStyles.applyTextStyles(
                styles: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Obx(
              () => Container(
                constraints: BoxConstraints(
                  minHeight: 46.h,
                ),
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(
                    signed: true,
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
                  ],
                  controller: controller.pinController,
                  obscureText: controller.showPin.isFalse,
                  validator: AppValidator.validatePin,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: const Color(0xFF292D32),
                      onPressed: controller.togglePin,
                      icon: Icon(
                        controller.showPin.isFalse
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                        color: const Color(0xFF292D32),
                        size: 20.h,
                      ),
                    ),
                    hintText: 'Enter your 4 digit pin',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.to(() => const ForgotPinScreen()),
                  child: Text(
                    'Forgot Pin',
                    style: AppTextStyles.applyTextStyles(
                      styles: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff001529),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
              width: AppDeviceUtils.getScreenWidth(context),
              height: 48.h,
              child: Obx(
                () => ElevatedButton(
                  onPressed: controller.isButtonDisabled.isTrue
                      ? null
                      : controller.onSubmit,
                  child: Text(
                    'Login',
                    style: AppTextStyles.applyTextStyles(
                      styles: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?',
                  style: AppTextStyles.applyTextStyles(
                    styles: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff949395),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6.0,
                ),
                GestureDetector(
                  onTap: () => Get.to(() => const RegistrationNavigation()),
                  child: Text(
                    'Sign Up',
                    style: AppTextStyles.applyTextStyles(
                      styles: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff001529),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
