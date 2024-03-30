import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/forgot_pin/forgot_pin_controller.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class ForgotPinFooter extends StatelessWidget {
  const ForgotPinFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPinController());

    return Container(
      height: 150.h,
      padding: EdgeInsets.all(18.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: AppDeviceUtils.getScreenWidth(context).w,
            height: 45.h,
            child: Obx(
              () => ElevatedButton(
                onPressed: controller.isButtonDisabled.isTrue
                    ? null
                    : controller.onSubmit,
                child: Text(
                  'Send Email',
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
