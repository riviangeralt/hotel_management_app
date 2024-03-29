import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/forgot_pin/forgot_pin_controller.dart';
import 'package:hotel_booking_app/utils/validators/validation.dart';

class ForgotPinForm extends StatelessWidget {
  const ForgotPinForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPinController());
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: TextFormField(
          controller: controller.emailController,
          validator: AppValidator.validateEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Enter email address',
          ),
        ),
      ),
    );
  }
}
