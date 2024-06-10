import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/features/auth/screens/create_pin/create_pin.dart';
import 'package:hotel_booking_app/features/auth/screens/create_pin/widgets/create_pin_footer.dart';
import 'package:hotel_booking_app/features/auth/screens/hotel_images/hotel_images.dart';
import 'package:hotel_booking_app/features/auth/screens/hotel_images/widgets/hotel_images_footer.dart';
import 'package:hotel_booking_app/features/auth/screens/location_info/location_info.dart';
import 'package:hotel_booking_app/features/auth/screens/location_info/widgets/location_info_footer.dart';
import 'package:hotel_booking_app/features/auth/screens/otp/otp.dart';
import 'package:hotel_booking_app/features/auth/screens/otp/widgets/otp_footer.dart';
import 'package:hotel_booking_app/features/auth/screens/registration/registration.dart';
import 'package:hotel_booking_app/features/auth/screens/registration/widgets/registration_footer.dart';

class RegistrationNavigation extends StatelessWidget {
  const RegistrationNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationNavigationController());
    return Obx(
      () => Scaffold(
        appBar: CustomAppBar(
          title: controller.currentScreen['title'],
          onBack: () => controller.currentStep.value == 0
              ? Get.back()
              : controller.updateSteps(controller.currentStep.value - 1),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                tween: Tween<double>(
                  begin: 0,
                  end: controller.currentScreen['value'],
                ),
                builder: (context, value, _) => LinearProgressIndicator(
                  backgroundColor: const Color(0xffC4C4C4),
                  value: value,
                  semanticsLabel:
                      '_${controller.currentScreen['title']} Indicator',
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: 36.h,
                  horizontal: 18.w,
                ),
                child: controller.currentScreen['screen'],
              )
            ],
          ),
        ),
        bottomNavigationBar: controller.currentScreen['footer'],
      ),
    );
  }
}

class RegistrationNavigationController extends GetxController {
  static RegistrationNavigationController get instance => Get.find();

  RxInt currentStep = 0.obs;

  List<Map<String, dynamic>> steps = [
    {
      "title": "Basic Information",
      "value": .2,
      "screen": const RegistrationScreen(),
      "footer": const RegistrationFooter()
    },
    {
      "title": "OTP Verification",
      "value": .4,
      "screen": const OtpScreen(),
      "footer": const OtpFooter()
    },
    {
      "title": "Create Pin",
      "value": .6,
      "screen": const CreatePinScreen(),
      "footer": const CreatePinFooter()
    },
    {
      "title": "Location Info",
      "value": .8,
      "screen": const LocationInfoScreen(),
      "footer": const LocationInfoFooter()
    },
    {
      "title": "Hotel Pictures",
      "value": 1.0,
      "screen": const HotelImagesScreen(),
      "footer": const HotelImagesFooter()
    },
  ];

  void updateSteps(int value) => currentStep.value = value;

  Map get currentScreen => steps[currentStep.value];
}
