import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';
import 'package:iconsax/iconsax.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: const Color(0xff31D0AA),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Room Booking',
                style: AppTextStyles.applyTextStyles(
                  styles: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Room 406 has been booked',
                style: AppTextStyles.applyTextStyles(
                  styles: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff5D6065),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Iconsax.arrow_right_1)
        ],
      ),
    );
  }
}
