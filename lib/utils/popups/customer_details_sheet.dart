import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/common/widgets/bottom_sheet_header.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

Future<Widget?> showCustomerDetailsSheet({
  required BuildContext context,
}) {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomSheetHeader(
              innerContext: innercontext,
              title: "Customer Details",
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              width: 80.w,
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  40.r,
                ),
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Agbama Ulimhuka',
              style: AppTextStyles.applyTextStyles(
                styles: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'agbama@gmail.com',
              style: AppTextStyles.applyTextStyles(
                styles: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff5D6065),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
