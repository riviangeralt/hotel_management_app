import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/common/widgets/icon_button.dart';
import 'package:hotel_booking_app/features/dashboard/screens/notification/notiffication.dart';
import 'package:hotel_booking_app/features/dashboard/screens/search_bookings/search_bookings.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Dashboard',
      showBack: false,
      centerTitle: false,
      actions: [
        SizedBox(
          width: 22.w,
          height: 22.h,
          child: CustomIconButton(
            onTap: () => Get.to(() => const SearchBookingsScreen()),
            child: Icon(
              Iconsax.search_normal_14,
              size: 16.5.h,
            ),
          ),
        ),
        SizedBox(
          width: 12.h,
        ),
        SizedBox(
          width: 22.w,
          height: 22.h,
          child: CustomIconButton(
            onTap: () => Get.to(() => const NotificationScreen()),
            child: Icon(
              Iconsax.notification_bing,
              size: 16.5.h,
            ),
          ),
        ),
        SizedBox(
          width: 12.h,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
