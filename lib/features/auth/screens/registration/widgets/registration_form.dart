import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/registration/registration_controller.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:hotel_booking_app/utils/validators/validation.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name of Hotel',
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
              controller: controller.hotelNameController,
              validator: AppValidator.validateHotelName,
              decoration: const InputDecoration(
                hintText: 'Enter hotel name',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'Email Address',
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
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
              validator: AppValidator.validateEmail,
              decoration: const InputDecoration(
                hintText: 'Enter email address',
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'Phone Number',
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
          ],
        ),
      ),
    );
  }
}
