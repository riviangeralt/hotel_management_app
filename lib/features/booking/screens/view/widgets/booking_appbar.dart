import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/common/widgets/icon_button.dart';
import 'package:hotel_booking_app/features/booking/controllers/view/view_controller.dart';
import 'package:hotel_booking_app/features/booking/screens/view/widgets/segmented_control.dart';
import 'package:hotel_booking_app/features/dashboard/screens/notification/notiffication.dart';
import 'package:hotel_booking_app/features/dashboard/screens/search_bookings/search_bookings.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class BookingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ViewController());
    return CustomAppBar(
      title: 'Bookings',
      showBack: false,
      centerTitle: false,
      actions: [
        SizedBox(
          width: 28.w,
          height: 28.h,
          child: CustomIconButton(
            onTap: () => Get.to(() => const SearchBookingsScreen()),
            child: Icon(
              Iconsax.search_normal_14,
              size: 18.h,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        SizedBox(
          width: 28.w,
          height: 28.h,
          child: CustomIconButton(
            onTap: () => Get.to(() => const NotificationScreen()),
            child: Icon(
              Iconsax.add,
              size: 26.h,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        )
      ],
      bottom: Obx(
        () => CustomSegmentedControl(
          list: const [
            "Ongoing",
            "Completed",
          ],
          onTabChange: controller.onTabChange,
          selected: controller.selectedTab.value,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppDeviceUtils.getAppBarHeight().h * 2);
}
