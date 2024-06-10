import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/bottom_sheet_header.dart';
import 'package:hotel_booking_app/features/booking/screens/add/add_booking.dart';
import 'package:hotel_booking_app/utils/popups/no_of_days_sheet.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

Future<Widget?> showAddNavigationSheet({
  required BuildContext context,
}) {
  List<Map<String, dynamic>> actionsList = [
    {
      "title": 'Add Rooms',
      "onTap": () {
        Navigator.pop(context);
        Get.to(() => const AddBookingScreen());
      },
    },
    {
      "title": 'Create Categories',
      "onTap": () {
        Navigator.pop(context);
        Get.to(() => const AddBookingScreen());
      },
    },
    {
      "title": 'Add Booking',
      "onTap": () {
        Navigator.pop(context);
        Get.to(() => const AddBookingScreen());
      },
    },
  ];

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext innercontext) {
      return Container(
        height: 250.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            BottomSheetHeader(
              innerContext: innercontext,
              title: "Create",
            ),
            ListView.builder(
              itemCount: actionsList.length,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                onTap: actionsList[index]['onTap'],
                title: Text(
                  actionsList[index]['title'],
                  style: AppTextStyles.applyTextStyles(
                    styles: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                trailing: Icon(
                  Iconsax.arrow_right_3,
                  size: 18.h,
                  color: const Color(0xffB7B8BA),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
