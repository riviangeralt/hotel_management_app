import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/dashboard/screens/search_bookings/search_bookings.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Recent Bookings',
          style: AppTextStyles.applyTextStyles(
            styles:  TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Get.to(() => const SearchBookingsScreen()),
          child: Text(
            'See all',
            style: AppTextStyles.applyTextStyles(
              styles:  TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: const Color(0xff0071FE),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
