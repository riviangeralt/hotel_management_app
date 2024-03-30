import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/bottom_sheet_header.dart';
import 'package:hotel_booking_app/utils/popups/customer_details_sheet.dart';
import 'package:hotel_booking_app/utils/popups/no_of_days_sheet.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:developer';

Future<Widget?> showBookingDetailsSheet({
  required BuildContext context,
}) {
  List<Map<String, dynamic>> actionsList = [
    {
      "title": 'View customer details',
      "onTap": () {
        Navigator.pop(context);
        showCustomerDetailsSheet(
          context: context,
        );
      },
    },
    {
      "title": 'Edit no of days',
      "onTap": () {
        Navigator.pop(context);
        showNoOfDaysSheet(
          context: context,
        );
      },
    },
    {
      "title": 'Change Booking Status',
      "onTap": () => log('3'),
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
              title: "More Actions",
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
