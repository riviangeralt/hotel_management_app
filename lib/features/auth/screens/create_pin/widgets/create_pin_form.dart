import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/create_pin/create_pin_controller.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:hotel_booking_app/utils/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class CreatePinForm extends StatelessWidget {
  const CreatePinForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePinController());
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Pin',
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
            Obx(
              () => TextFormField(
                controller: controller.pinController,
                validator: AppValidator.validatePin,
                obscureText: controller.showPin.isFalse,
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
                ],
                decoration: InputDecoration(
                  hintText: 'Enter 4 digit pin',
                  suffixIcon: IconButton(
                    color: const Color(0xFF292D32),
                    onPressed: controller.togglePin,
                    icon: Icon(
                      controller.showPin.isFalse
                          ? Iconsax.eye
                          : Iconsax.eye_slash,
                      color: const Color(0xFF292D32),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              'Confirm Pin',
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
            Obx(
              () => TextFormField(
                controller: controller.confirmPinController,
                obscureText: controller.showConfirmPin.isFalse,
                validator: (value) => controller.checkPinEqual(value),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,4}'))
                ],
                decoration: InputDecoration(
                  hintText: 'Re-Enter pin',
                  suffixIcon: IconButton(
                    color: const Color(0xFF292D32),
                    onPressed: controller.toggleConfirmPin,
                    icon: Icon(
                      controller.showConfirmPin.isFalse
                          ? Iconsax.eye
                          : Iconsax.eye_slash,
                      color: const Color(0xFF292D32),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
