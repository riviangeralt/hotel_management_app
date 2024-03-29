import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/auth_footer.dart';
import 'package:hotel_booking_app/features/auth/controllers/otp/otp_controller.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class OtpFooter extends StatelessWidget {
  const OtpFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OtpController());

    return Container(
      height: 150,
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          const AuthFooter(
            text: "No OTP yet?",
            ctaText: "Resend OTP",
          ),
          const SizedBox(
            height: 24.0,
          ),
          SizedBox(
            width: AppDeviceUtils.getScreenWidth(context),
            height: 45,
            child: Obx(
              () => ElevatedButton(
                onPressed: controller.isButtonDisabled.isTrue
                    ? null
                    : controller.onSubmit,
                child: Text(
                  'Verify OTP',
                  style: AppTextStyles.applyTextStyles(
                    styles: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
