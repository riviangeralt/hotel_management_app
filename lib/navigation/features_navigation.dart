import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/account/screens/view/account.dart';
import 'package:hotel_booking_app/features/account/screens/view/widgets/account_appbar.dart';
import 'package:hotel_booking_app/features/booking/screens/view/booking.dart';
import 'package:hotel_booking_app/features/booking/screens/view/widgets/booking_appbar.dart';
import 'package:hotel_booking_app/features/dashboard/screens/view/dashboard.dart';
import 'package:hotel_booking_app/features/dashboard/screens/view/widgets/dashboard_appbar.dart';
import 'package:hotel_booking_app/features/room/screens/view/room.dart';
import 'package:hotel_booking_app/features/room/screens/view/widgets/room_appbar.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

class FeaturesNavigation extends StatelessWidget {
  const FeaturesNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeaturesNavigationController());
    return Obx(
      () => Scaffold(
        appBar: controller.currentScreen['appbar'],
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.w,
              horizontal: 16.h,
            ),
            child: controller.currentScreen['screen'],
          ),
        ),
        bottomNavigationBar: Container(
          height: 75.h,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: const Color(0xFF1721EE).withOpacity(.08),
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: IconTextColumn(
                      icon: controller.currentStep.value == 0
                          ? Iconsax.home_15
                          : Iconsax.home,
                      text: "Dashboard",
                      onTap: () => controller.updateSteps(0),
                      isSelected: controller.currentStep.value == 0,
                    ),
                  ),
                  Expanded(
                    child: IconTextColumn(
                      icon: controller.currentStep.value == 1
                          ? Iconsax.note_215
                          : Iconsax.note_2,
                      text: "Booking",
                      onTap: () => controller.updateSteps(1),
                      isSelected: controller.currentStep.value == 1,
                    ),
                  ),
                  const Expanded(
                    child: Icon(
                      Iconsax.add_circle5,
                      size: 36.0,
                      color: Color(0xff001529),
                    ),
                  ),
                  Expanded(
                    child: IconTextColumn(
                      icon: controller.currentStep.value == 2
                          ? Iconsax.archive_15
                          : Iconsax.archive_1,
                      text: "Rooms",
                      onTap: () => controller.updateSteps(2),
                      isSelected: controller.currentStep.value == 2,
                    ),
                  ),
                  Expanded(
                    child: IconTextColumn(
                      icon: controller.currentStep.value == 3
                          ? Iconsax.profile_2user5
                          : Iconsax.profile_2user,
                      text: "Account",
                      onTap: () => controller.updateSteps(3),
                      isSelected: controller.currentStep.value == 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IconTextColumn extends StatelessWidget {
  const IconTextColumn({
    super.key,
    required this.icon,
    required this.text,
    this.iconSize = 24.0,
    this.textSize = 10.0,
    this.onTap,
    required this.isSelected,
  });

  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: iconSize.h,
            color:
                isSelected ? const Color(0xff0071FE) : const Color(0xff96949E),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            text,
            style: AppTextStyles.applyTextStyles(
              styles: TextStyle(
                fontSize: textSize,
                color: isSelected
                    ? const Color(0xff0071FE)
                    : const Color(0xff96949E),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FeaturesNavigationController extends GetxController {
  RxInt currentStep = 0.obs;

  List<Map<String, dynamic>> steps = [
    {
      "title": "Dashboard",
      "screen": const DashboardScreen(),
      "appbar": const DashboardAppBar(),
    },
    {
      "title": "Bookings",
      "screen": const BookingsScreen(),
      "appbar": const BookingsAppBar(),
    },
    {
      "title": "Rooms",
      "screen": const RoomsScreen(),
      "appbar": const RoomAppBar(),
    },
    {
      "title": "Account",
      "screen": const AccountScreen(),
      "appbar": const AccountAppBar(),
    },
  ];

  void updateSteps(int value) => currentStep.value = value;

  Map get currentScreen => steps[currentStep.value];
}
