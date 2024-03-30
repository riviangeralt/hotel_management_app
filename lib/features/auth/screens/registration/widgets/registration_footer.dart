import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/auth_footer.dart';
import 'package:hotel_booking_app/features/auth/controllers/registration/registration_controller.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class RegistrationFooter extends StatelessWidget {
  const RegistrationFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Container(
      height: 150,
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          SizedBox(
            width: AppDeviceUtils.getScreenWidth(context),
            height: 45,
            child: Obx(
              () => ElevatedButton(
                onPressed: controller.isButtonDisabled.isTrue
                    ? null
                    : controller.onSubmit,
                child: Text(
                  'Proceed',
                  style: AppTextStyles.applyTextStyles(
                    styles: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          AuthFooter(
            text: "Already have an account?",
            ctaText: "Sign In",
            onCtaClick: () => Get.back(),
          )
        ],
      ),
    );
  }
}
