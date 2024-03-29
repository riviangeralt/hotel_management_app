import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/otp/otp_controller.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:hotel_booking_app/utils/validators/validation.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'OTP Code',
              style: AppTextStyles.applyTextStyles(
                styles: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: controller.otpCodeController,
              validator: AppValidator.validateOtp,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
              ],
              decoration: const InputDecoration(
                hintText: 'Enter 6 digit otp code',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
