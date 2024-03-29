import 'package:flutter/material.dart';
import 'package:hotel_booking_app/common/widgets/appbar.dart';
import 'package:hotel_booking_app/common/widgets/icon_button.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class RoomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RoomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Rooms',
      showBack: false,
      centerTitle: false,
      actions: [
        // CustomIconButton(
        //   onTap: () {},
        //   child: const Icon(
        //     Iconsax.search_normal,
        //   ),
        // ),
        // const SizedBox(
        //   width: 16.0,
        // ),
        // CustomIconButton(
        //   onTap: () {},
        //   child: const Icon(
        //     Iconsax.notification_bing,
        //   ),
        // ),
        const SizedBox(
          width: 12.0,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppDeviceUtils.getAppBarHeight());
}
