import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  final Color color;
  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding:  EdgeInsets.all(10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppTextStyles.applyTextStyles(
                styles:  TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              value.toString(),
              style: AppTextStyles.applyTextStyles(
                styles:  TextStyle(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
